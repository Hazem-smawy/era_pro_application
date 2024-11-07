// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';
// import 'dart:typed_data';

import 'package:era_pro_application/src/core/utils/dialogs.dart';
import 'package:era_pro_application/src/features/bills/domain/usecases/add_bill_details_usecase.dart';
import 'package:era_pro_application/src/features/store/domain/entities/item_details_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:era_pro_application/src/features/accounts/presentation/getX/accounts_controller.dart';
import 'package:era_pro_application/src/features/bills/domain/entities/bill_entity.dart';
import 'package:era_pro_application/src/features/bills/domain/usecases/add_new_bill_usecase.dart';
import 'package:era_pro_application/src/features/bills/domain/usecases/get_last_id_usecase.dart';
import 'package:era_pro_application/src/features/main_info/domain/entities/main_info_entity.dart';
import 'package:era_pro_application/src/features/main_info/presentation/getX/main_info_controller.dart';
import 'package:era_pro_application/src/features/store/domain/entities/store_entity.dart';
import 'package:era_pro_application/src/features/store/presentation/getX/store_controller.dart';

import '../../../user/presentation/getX/user_controller.dart';
import '../../domain/entities/bill_details_entity.dart';
import '../../domain/entities/bill_ui_entity.dart';

class BillController extends GetxController {
  //outer
  MainInfoController mainInfoController = Get.find();
  UserController user = Get.find();
  AccountsController accountsController = Get.find();

  // locals
  var items = <ItemUI>[].obs;
  var totalItem = <ItemUI>[].obs;
  var cart = <ItemUI>[].obs;
  var groups = <ItemGroupEntity>[].obs;
  StoreController storeController = Get.find();

  var selectedUnit = <int, Rx<int>>{}.obs;
  var selectedUnitIndex = <int, RxInt>{}.obs;
  var selectedGroupId = 0.obs;
  var paymentType = false.obs;
  TextEditingController itemDetailsPriceController = TextEditingController();
  TextEditingController customerName = TextEditingController();
  TextEditingController billNoteTextEditingController = TextEditingController();

  final taxRateTextEditing = TextEditingController().obs;
  final taxPercentTextEditing = TextEditingController().obs;
  final discountPercentTextEditing = TextEditingController().obs;
  final discountRateTextEditing = TextEditingController().obs;

  //bill text
  TextEditingController billDiscountPercent = TextEditingController();
  TextEditingController billDiscountRate = TextEditingController();
  TextEditingController billTaxPercent = TextEditingController();
  TextEditingController billTaxRate = TextEditingController();

  var newBill = Rx<BillUI?>(null);
  var paymentMethods = <PaymentEntity>[];

  //usecase

  AddNewBillUsecase addNewBillUsecase;
  GetLastIdUsecase getLastIdUsecase;
  AddBillDetailsUsecase addBillDetailsUsecase;
  BillController({
    required this.addNewBillUsecase,
    required this.getLastIdUsecase,
    required this.addBillDetailsUsecase,
  });
  @override
  void onInit() {
    super.onInit();
    getItems();
    newBill.value = BillUI();
  }

  void filterItemsByGroup(int groupId) async {
    if (groupId == 0) {
      selectedGroupId.value = 0;
      items.value = totalItem;
    } else {
      selectedGroupId.value = groupId;
      items.value = totalItem;

      items.value = items.where((e) => e.groupId == groupId).toList();
    }
  }

  Future<StoreItemDetailsEntity> getItemStoreDetails(ItemUI item) async {
    final selectedItemWithDetails = storeController.allItemsWithDetails.value
        .firstWhere((e) => e.item.id == item.id);
    return selectedItemWithDetails;
  }

  Future<void> filterItemsBySearch(String name) async {
    if (name.trim().isNotEmpty) {
      items.value = items.where((e) => e.name.contains(name)).toList();
    } else {
      items.value = totalItem;
    }
  }

  void updatedUnitId(int unitHash, int newIndex) {
    selectedUnit[unitHash]?.value = newIndex;
  }

  // Get the selected price for the given unit hash
  UnitDetailsUI getSelectedUnit(int unitHash, List<UnitDetailsUI> unitDetails) {
    int index = selectedUnitIndex[unitHash]?.value ?? 0;
    return unitDetails[index];
  }

  Future<void> getItems() async {
    items.clear();
    final storeItems = await storeController.getAllItems();
    final units = await storeController.getAllUnits();
    final itemUnits = await storeController.getAllItemsUnit();
    final operations = await storeController.getStoreOperations();
    groups.value = await storeController.getAllItemGroupsInfo();
    for (var item in storeItems) {
      final unitsDetails = <UnitDetailsUI>[].obs;
      final newItemUnits = itemUnits.where((e) => e.itemId == item.id);

      if (newItemUnits.isNotEmpty) {
        for (var itemUint in newItemUnits) {
          final newUnit = units.firstWhere((e) => e.id == itemUint.itemUnitId);

          int quantity = operations
              .where((e) => e.itemId == item.id && e.unitId == newUnit.id)
              .fold(0, (pre, el) => pre + el.quantity);

          final ud = UnitDetailsUI(
              // constantQuantity: quantity,
              note: '',
              discountPercent: 0,
              taxPercent: 0,
              intialCost: itemUint.intialCost,
              freeQuantity: 0,
              updatedQuantity: 0,
              id: itemUint.id,
              name: newUnit.name,
              quantityRemaining: quantity,
              totalPrice: 0,
              tax: 0,
              discount: 0,
              price: itemUint.retailPrice,
              selectedPrice: itemUint.retailPrice,
              firstPrice: itemUint.retailPrice,
              secondPrice: itemUint.spacialPrice,
              thirdPrice: itemUint.wholeSaleprice,
              unitFactor: itemUint.unitFactor);

          if (ud.quantityRemaining > 0) {
            unitsDetails.add(ud);
          }
        }
      }

      if (unitsDetails.isNotEmpty) {
        int totalQuantity = unitsDetails.fold(
            0, (pre, el) => pre + (el.quantityRemaining * el.unitFactor));

        for (var e in unitsDetails) {
          e.quantityRemaining = totalQuantity ~/ e.unitFactor;
          // e.constantQuantity = totalQuantity ~/ e.unitFactor;
        }

        final newItem = ItemUI(
          freeUnitId: unitsDetails.firstWhere((e) => e.unitFactor == 1).id,
          allQuantityOfItem: totalQuantity,
          id: item.id,
          name: item.name,
          image: item.itemImage,
          unitDetails: unitsDetails,
          smallUnit: unitsDetails.firstWhere((e) => e.unitFactor == 1),
          selectedUnit: unitsDetails.firstWhere((e) => e.unitFactor == 1),
          itemTotalPrice: 0,
          indexOfUnitDetails: 0,
          groupId: item.itemGroupId,
        );
        totalItem.add(newItem);

        items.value = totalItem;
      }
    }
  }

  void nextUnitDetails(ItemUI item) {
    // Find the current item index based on the ID
    int currentIndex =
        item.unitDetails.indexWhere((unit) => unit.id == item.selectedUnit.id);

    if (currentIndex != -1 && currentIndex < item.unitDetails.length - 1) {
      // Move to the next item's ID
      item.selectedUnit = item.unitDetails[currentIndex + 1];
      item.freeUnitId = item.unitDetails[currentIndex + 1].id;
    } else {
      // If it's the last item, loop back to the first item's ID
      item.selectedUnit = item.unitDetails[0];
      item.freeUnitId = item.unitDetails[0].id;
    }
    items.refresh();
  }

  Future updateSelectedPrice(int itemId, int itemUnitId, int number) async {
    final itemUnits = await storeController.getAllItemsUnit();

    ItemUI updatedItem = items.firstWhere((e) => e.id == itemId);
    final selectedItemUnit = itemUnits.firstWhere((e) => e.id == itemUnitId);
    UnitDetailsUI unitDetails =
        updatedItem.unitDetails.firstWhere((e) => e.id == selectedItemUnit.id);
    if (number == 1) {
      unitDetails.selectedPrice = unitDetails.firstPrice;
    } else if (2 == number) {
      unitDetails.selectedPrice = unitDetails.secondPrice;
    } else {
      unitDetails.selectedPrice = unitDetails.thirdPrice;
    }

    updatedItem.itemTotalPrice = unitDetails.selectedPrice;

    refreshItemBillInfo(updatedItem);

    updatePercentWhenPriceChange(updatedItem);

    refreshItemBillInfo(updatedItem);

    items.refresh();
  }

  void updatePercentWhenPriceChange(ItemUI updatedItem) {
    discountRateTextEditing.value.clear();
    discountRateTextEditing.value.text = (updatedItem.selectedUnit.totalPrice *
            updatedItem.selectedUnit.discountPercent /
            100)
        .toStringAsFixed(2);
    taxRateTextEditing.value.clear();
    taxRateTextEditing.value.text = (updatedItem.selectedUnit.totalPrice *
            updatedItem.selectedUnit.tax /
            100)
        .toStringAsFixed(2);
  }

  void refreshBillTextEditingControllers() {
    if (newBill.value!.addedDiscount > 0) {
      billDiscountRate.text = newBill.value!.addedDiscount.toString();
      billDiscountPercent.text =
          (newBill.value!.addedDiscount / newBill.value!.totalPrice * 100)
              .toStringAsFixed(2);
    }
    if (newBill.value!.addedTax > 0) {
      billTaxRate.text = newBill.value!.addedTax.toString();
      billTaxPercent.text =
          (newBill.value!.addedTax / newBill.value!.totalPrice * 100)
              .toStringAsFixed(2);
    }
  }

  void refreshTextEditingControllers(ItemUI item) {
    if (item.selectedUnit.discount != 0) {
      discountRateTextEditing.value.text =
          item.selectedUnit.discount.toString();
      discountPercentTextEditing.value.text =
          item.selectedUnit.discountPercent.toStringAsFixed(2);
    } else {
      discountPercentTextEditing.value.clear();
      discountRateTextEditing.value.clear();
    }

    if (item.selectedUnit.tax != 0) {
      taxRateTextEditing.value.text = item.selectedUnit.tax.toString();
      taxPercentTextEditing.value.text =
          item.selectedUnit.taxPercent.toStringAsFixed(2);
    } else {
      taxRateTextEditing.value.clear();
      taxPercentTextEditing.value.clear();
    }
  }

  void changeUnit(value, item) {
    items
        .firstWhere(
          (element) => element.id == item.id,
        )
        .selectedUnit = value ?? item.unitDetails[0];
    items
        .firstWhere(
          (element) => element.id == item.id,
        )
        .freeUnitId = value?.id ?? item.unitDetails[0].id;

    refreshItemBillInfo(item);
    refreshTextEditingControllers(item);
  }

  void updateQuantity(int itemId, int quantity, int freeQuntity) {
    print(itemId);
    ItemUI updatedItem = items.firstWhere((e) => e.id == itemId);
    var freeUnit = updatedItem.unitDetails
        .firstWhere((e) => e.id == updatedItem.freeUnitId);

    if (quantity == 1) {
      if (updatedItem.selectedUnit.quantityRemaining > 0) {
        updatedItem.selectedUnit.updatedQuantity += quantity;
        updatedItem.selectedUnit.quantityRemaining -= quantity;

        // //update
        updatedQuantitiesForItem(
            quantity, updatedItem, updatedItem.selectedUnit);
        refreshItemBillInfo(updatedItem);
        // e.constantQuantity = updatedItem.allQuantityOfItem ~/ e.unitFactor;
      }
    } else if (quantity == -1) {
      updatedItem.selectedUnit.updatedQuantity += quantity;
      updatedItem.selectedUnit.quantityRemaining -= quantity;
      // updatedQuantitiesForItem(quantity, updatedItem, updatedItem.selectedUnit);
      updatedItem.allQuantityOfItem = updatedItem.allQuantityOfItem -
          quantity * updatedItem.selectedUnit.unitFactor;

      for (var e in updatedItem.unitDetails) {
        e.quantityRemaining = 0;
        e.quantityRemaining = updatedItem.allQuantityOfItem ~/ e.unitFactor;
      }
      refreshItemBillInfo(updatedItem);
      //update
      // updatedQuantitiesForItem(quantity, updatedItem, freeUnit);
    }

    if (updatedItem.selectedUnit.id == freeUnit.id) {
      if (freeQuntity == 1) {
        if (freeUnit.quantityRemaining > 0) {
          updatedItem.selectedUnit.freeQuantity += 1;
          updatedItem.selectedUnit.quantityRemaining -= 1;

          //update quantities
          updatedQuantitiesForItem(freeQuntity, updatedItem, freeUnit);
          refreshItemBillInfo(updatedItem);
        }
      } else if (freeQuntity == -1) {
        updatedItem.selectedUnit.freeQuantity -= 1;
        updatedItem.selectedUnit.quantityRemaining += 1;

        //update quantities
        updatedQuantitiesForItem(freeQuntity, updatedItem, freeUnit);
        refreshItemBillInfo(updatedItem);
      }
    }
    updatePercentWhenPriceChange(updatedItem);
  }

  void updatedQuantitiesForItem(
      int quantity, ItemUI updatedItem, UnitDetailsUI selectedUnit) {
    if (updatedItem.allQuantityOfItem > selectedUnit.unitFactor) {
      updatedItem.allQuantityOfItem =
          updatedItem.allQuantityOfItem - quantity * selectedUnit.unitFactor;

      for (var e in updatedItem.unitDetails) {
        e.quantityRemaining = 0;
        e.quantityRemaining = updatedItem.allQuantityOfItem ~/ e.unitFactor;
        // e.constantQuantity = updatedItem.allQuantityOfItem ~/ e.unitFactor;
      }
    }
  }

  void refreshItemBillInfo(ItemUI updatedItem) {
    updatedItem.selectedUnit.totalPrice =
        updatedItem.selectedUnit.selectedPrice *
            updatedItem.selectedUnit.updatedQuantity;

    // updatedItem.totalPrice = updatedItem.unitDetails
    //     .map((unit) => unit)
    //     .map(( value,element) =>
    //         value element.totalPrice - element.discount + element.tax);

    //caculated Discount
    updatedItem.clearPrice = updatedItem.unitDetails
        .map((unit) => unit.clearPrice)
        .reduce((value, element) => value + element);

    // updatedItem.totalPriceWithDiscountRate = updatedItem.discountRate;

    //caculated TAX
    // updatedItem.clearPrice = updatedItem.totalPrice -
    //     updatedItem.totalPriceWithTaxPercent -
    //     updatedItem.totalPriceWithTaxRate;
    // updatedItem.totalPriceWithTaxPercent =
    //     (updatedItem.totalPrice * updatedItem.taxPercent);

    // clear Price
    // updatedItem.clearPrice = updatedItem.totalPriceBeforeDiscountAndTax -
    //     updatedItem.totalPriceWithTaxPercent -
    //     updatedItem.totalPriceWithTaxRate -
    //     updatedItem.totalPriceWithDiscountRate -
    //     updatedItem.totalPriceWithDiscountPercent;

    //update cart
    if (updatedItem.unitDetails.any((item) => item.updatedQuantity > 0)) {
      if (!cart.contains(updatedItem)) {
        cart.add(updatedItem);
      } else {
        int index = cart.indexWhere((e) => e.id == updatedItem.id);
        cart[index] = updatedItem;
      }
    } else {
      cart.remove(updatedItem);
    }

    newBill.value?.numberOfItems = cart.length;
    newBill.value?.totalPrice =
        cart.fold(0, (prevValue, item) => prevValue + item.clearPrice);

    newBill.value?.tax =
        cart.fold(0, (prevValue, item) => prevValue + item.tax);
    newBill.value?.discount =
        cart.fold(0, (prevValue, item) => prevValue + item.discount);

    updateBill();

    items.refresh();
    cart.refresh();
  }

  void updateBill() {
    newBill.value?.clearPrice = newBill.value!.totalPrice -
        newBill.value!.addedDiscount +
        newBill.value!.addedTax;

    newBill.refresh();
  }

  // caculate the new bill

  // Future<void> addNewBill() async {
  //   final selectedItems = items.expand((item) {
  //     return item.unitDetails
  //         .where((unit) => unit.updatedQuantity > 0 || unit.freeQuantity > 0)
  //         .map((unit) {
  //       // Create a new item with only this single unit
  //       return item.copyWith(unitDetails: [unit]);
  //     });
  //   }).toList();

  //   // item-unit
  //   // bool hasVAT = false;
  //   final billDetails = <BillDetailsEntity>[];
  //   for (var selectedItem in selectedItems) {
  //     var selectedItemUnitDetail = selectedItem.unitDetails.first;
  //     billDetails.add(
  //       BillDetailsEntity(
  //         billID: 1,
  //         itemId: selectedItem.id,
  //         itemUnitID: selectedItemUnitDetail.id,
  //         unitFactor: selectedItemUnitDetail.unitFactor,
  //         quantity: selectedItemUnitDetail.updatedQuantity,
  //         freeQty: selectedItemUnitDetail.freeQuantity,
  //         avrageCost: selectedItemUnitDetail.intialCost,
  //         sellPrice: selectedItemUnitDetail.selectedPrice,
  //         totalSellPrice: selectedItemUnitDetail.totalPrice,
  //         discountPre: selectedItemUnitDetail.discountPercent,
  //         netSellPrice: selectedItemUnitDetail.clearPrice,
  //         expirDate: null,
  //         taxRate: selectedItemUnitDetail.taxPercent,
  //         itemNote: selectedItemUnitDetail.note,
  //         freeQtyCost: selectedItemUnitDetail.intialCost *
  //             selectedItemUnitDetail.freeQuantity,
  //       ),
  //     );
  //   }

  //   final hasSalesTax = billDetails.any((e) => e.taxRate > 0);
  //   double freeQuantityConst =
  //       billDetails.fold(0, (prev, item) => prev + item.freeQtyCost);
  //   double totalPrice =
  //       billDetails.fold(0, (prev, value) => prev + value.totalSellPrice);
  //   double averagePrice = billDetails.fold(
  //       0, (prev, value) => prev + value.avrageCost * value.quantity);

  //   // final hasVat = billDetails.fold((e) => e.taxRate > 0);
  //   // final salesTax = billDetails.fold((value,elem)=> value + elem.)

  //   //bill
  //   final branchId = mainInfoController.branch.value?.id;
  //   final userId = user.user.value?.id;
  //   final paymentMethodId = mainInfoController.selectedPaymentsMethod.value?.id;
  //   final receiveAccount = mainInfoController.selectedPaymentsMethodDetails;
  //   final storId = storeController.userStoreInfo.value?.id;

  //   BillEntity newSellingBill = BillEntity(
  //     id: -1,
  //     branchId: branchId ?? 0,
  //     billNumber: 0, //
  //     billType: 1,
  //     billDate: DateTime.now(),
  //     refNumber: '1', // id from sever
  //     customerNumber: newBill.value?.customerNumber ?? 0,
  //     currencyId: mainInfoController.selecteCurency.value?.id ?? 0,
  //     currencyValue: mainInfoController.selecteCurency.value?.value ?? 0,
  //     fundNumber: receiveAccount.value?.id ?? 0, //account
  //     paymentMethed:
  //         !mainInfoController.paymentType.value ? paymentMethodId ?? 0 : 0,
  //     storeId: storId ?? 0,
  //     storeCurValue: mainInfoController.storCurency.value,
  //     billNote: newBill.value?.note ?? '',
  //     itemCalcMethod: 1,
  //     dueDate: DateTime.now(), // شيك
  //     salesPerson: userId ?? 0,
  //     hasVat: hasSalesTax, //items
  //     hasSalesTax: newBill.value!.addedTax > 0, // bill
  //     salesTaxRate: (newBill.value!.addedTax / newBill.value!.totalPrice) *
  //         100, //% add tax for bill
  //     numOfitems: billDetails.length,
  //     totalBill: totalPrice, //before any dicount * any tax
  //     itemsDiscount: newBill.value?.discount ?? 0,
  //     billDiscount: newBill.value?.addedDiscount ?? 0,
  //     netBill: newBill.value!.totalPrice -
  //         newBill.value!.addedDiscount -
  //         newBill.value!.discount, // total - any discount
  //     totalVat: newBill.value!.addedTax + newBill.value!.tax, //all tax
  //     billFinalCost:
  //         newBill.value?.clearPrice ?? 0, // tatal after tax and dscount
  //     freeQtyCost: freeQuantityConst,
  //     totalAvragCost: averagePrice, // inta * quantity
  //     paidAmount: 2,
  //   );

  //   //add new bills
  //   final result = await getLastIdUsecase.call(8);
  //   result.fold((failure) => print(failure.message), (r) async {
  //     newSellingBill.billNumber = r + 1;
  //     final result = await addNewBillUsecase.call(newSellingBill);
  //     result.fold((failure) => print(failure.message), (billId) async {
  //       List<BillDetailsEntity> newBillDetials =
  //           billDetails.map((e) => e.copyWith(billID: billId ?? 0)).toList();
  //       final res = await addBillDetailsUsecase.call(newBillDetials);
  //       res.fold(
  //           (failure) => print(failure.message), (e) => print('successful'));
  //     });
  //   });
  // }
  Future<void> addNewBill() async {
    if (newBill.value?.customerNumber == 0) {
      CustomDialog.customSnackBar(
          'يرجى ادخال اسم العميل', SnackPosition.TOP, true);
      return;
    }
    final selectedItems = items.expand((item) {
      return item.unitDetails
          .where((unit) => unit.updatedQuantity > 0 || unit.freeQuantity > 0)
          .map((unit) => item.copyWith(unitDetails: [unit]));
    }).toList();

    final billDetails = selectedItems.map((selectedItem) {
      final unitDetail = selectedItem.unitDetails.first;
      return BillDetailsEntity(
        id: -1,
        billID: 1,
        itemId: selectedItem.id,
        itemUnitID: unitDetail.id,
        unitFactor: unitDetail.unitFactor,
        quantity: unitDetail.updatedQuantity,
        freeQty: unitDetail.freeQuantity,
        avrageCost: unitDetail.intialCost,
        sellPrice: unitDetail.selectedPrice,
        totalSellPrice: unitDetail.totalPrice,
        discountPre: unitDetail.discountPercent,
        netSellPrice: unitDetail.clearPrice,
        expirDate: null,
        taxRate: unitDetail.taxPercent,
        itemNote: unitDetail.note,
        freeQtyCost: unitDetail.intialCost * unitDetail.freeQuantity,
      );
    }).toList();

    final hasSalesTax = billDetails.any((e) => e.taxRate > 0);
    final freeQuantityCost =
        billDetails.fold(0.0, (sum, item) => sum + item.freeQtyCost);
    final totalPrice =
        billDetails.fold(0.0, (sum, item) => sum + item.totalSellPrice);
    final averagePrice = billDetails.fold(
        0.0, (sum, item) => sum + (item.avrageCost * item.quantity));

    final branchId = mainInfoController.branch.value?.id ?? 0;
    final userId = user.user.value?.id ?? 0;
    final paymentMethodId =
        mainInfoController.selectedPaymentsMethod.value?.id ?? 0;
    final receiveAccount =
        mainInfoController.selectedPaymentsMethodDetails.value?.id ?? 0;
    final storeId = storeController.userStoreInfo.value?.id ?? 0;
    final currencyId = mainInfoController.selecteCurency.value?.id ?? 0;
    final currencyValue = mainInfoController.selecteCurency.value?.value ?? 0;
    final storeCurrencyValue = mainInfoController.storCurency.value;

    final newSellingBill = BillEntity(
      id: -1,
      branchId: branchId,
      billNumber: 0,
      billType: 8,
      billDate: newBill.value?.dueDate ?? DateTime.now(),
      refNumber: '1',
      customerNumber: newBill.value!.customerNumber,
      currencyId: currencyId,
      currencyValue: currencyValue,
      fundNumber: receiveAccount,
      paymentMethed: mainInfoController.paymentType.value ? 0 : paymentMethodId,
      storeId: storeId,
      storeCurValue: storeCurrencyValue,
      billNote: itemDetailsPriceController.text,
      itemCalcMethod: 1,
      dueDate: DateTime.now(),
      salesPerson: userId,
      hasVat: hasSalesTax,
      hasSalesTax: newBill.value!.addedTax > 0,
      salesTaxRate: (newBill.value!.addedTax / newBill.value!.totalPrice) * 100,
      numOfitems: billDetails.length,
      totalBill: totalPrice,
      itemsDiscount: newBill.value?.discount ?? 0,
      billDiscount: newBill.value?.addedDiscount ?? 0,
      netBill: newBill.value!.totalPrice -
          newBill.value!.addedDiscount -
          newBill.value!.discount,
      totalVat: newBill.value!.addedTax + newBill.value!.tax,
      billFinalCost: newBill.value?.clearPrice ?? 0,
      freeQtyCost: freeQuantityCost,
      totalAvragCost: averagePrice,
      paidAmount: double.tryParse(mainInfoController
              .paymentAmountTextEditingController.value.text) ??
          0,
    );

    final result = await getLastIdUsecase.call(8);
    result.fold(
      (failure) => print(failure.message),
      (lastId) async {
        print('lastbillId : $lastId');
        newSellingBill.billNumber = lastId + 1;
        final addBillResult = await addNewBillUsecase.call(newSellingBill);
        addBillResult.fold(
          (failure) => print(failure.message),
          (billId) async {
            print('bill id : $billId');
            final updatedBillDetails = billDetails
                .map((detail) => detail.copyWith(billID: billId ?? 0))
                .toList();
            final addDetailsResult =
                await addBillDetailsUsecase.call(updatedBillDetails);
            addDetailsResult.fold(
              (failure) => print(failure.message),
              (_) => print('Bill added successfully'),
            );
          },
        );
      },
    );
  }
}

// curencies
// date fo verify
// journals
