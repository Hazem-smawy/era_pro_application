// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';
// import 'dart:typed_data';

import 'package:era_pro_application/src/core/usecases/usecases.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:typed_data';

import 'package:era_pro_application/src/core/types/status_types.dart';
import 'package:era_pro_application/src/core/utils/dialogs.dart';
import 'package:era_pro_application/src/core/utils/perecent_caculator.dart';
import 'package:era_pro_application/src/features/accounts/presentation/getX/accounts_controller.dart';
import 'package:era_pro_application/src/features/bills/domain/entities/bill_entity.dart';
import 'package:era_pro_application/src/features/main_info/presentation/getX/main_info_controller.dart';
import 'package:era_pro_application/src/features/store/domain/entities/item_details_entity.dart';
import 'package:era_pro_application/src/features/store/domain/entities/store_entity.dart';
import 'package:era_pro_application/src/features/store/domain/usecases/get_item_image_usecase.dart';
import 'package:era_pro_application/src/features/store/presentation/getX/store_controller.dart';

import '../../../user/presentation/getX/user_controller.dart';
import '../../domain/entities/bill_ui_entity.dart';

class ItemController extends GetxController {
  //controller
  MainInfoController mainInfoController = Get.find();
  UserController userController = Get.find();
  AccountsController accountsController = Get.find();
  StoreController storeController = Get.find();

  // locals
  var items = <ItemUI>[].obs;
  var totalItem = <ItemUI>[].obs;
  var tempItem = <ItemUI>[].obs;
  var card = Rxn<CardUI>(CardUI(
    items: [],
    addedDiscount: 0,
    addedTax: 0,
  ));
  var groups = <ItemGroupEntity>[].obs;

  var selectedUnit = <int, Rx<int>>{}.obs;
  var selectedUnitIndex = <int, RxInt>{}.obs;
  var selectedGroupId = 0.obs;
  var paymentType = false.obs;
  var isSort = false.obs;
  var isItemWithOperationQuantity = false.obs;

  final taxRateTextEditing = TextEditingController().obs;
  final taxPercentTextEditing = TextEditingController().obs;
  final discountPercentTextEditing = TextEditingController().obs;
  final discountRateTextEditing = TextEditingController().obs;

  //usecase
  GetItemImageUsecase getItemImageUsecase;

  var errorMessage = ''.obs;
  ItemController({
    required this.getItemImageUsecase,
  });
  final itemStatus = RxStatus.empty().obs;

  final billType = 8.obs;

  Future<void> sortItem() async {
    isSort.value = !isSort.value;
    items.sort(
      isSort.value
          ? (a, b) => b.name.compareTo(a.name)
          : (a, b) => a.name.compareTo(b.name),
    );
    items.refresh();
    // If items.value is an ObservableList and needs to be updated
    // items.value = items.value;
  }

  // Future<void> itemWithQuantity() async {
  //   isItemWithOperationQuantity.value = !isItemWithOperationQuantity.value;

  //   isItemWithOperationQuantity.value
  //       ? selectedGroupId.value != 0
  //           ? items.value = totalItem
  //               .where((e) =>
  //                   e.allQuantityOfItem > 0 &&
  //                   e.groupId == selectedGroupId.value)
  //               .toList()
  //           : items.value =
  //               totalItem.where((e) => e.allQuantityOfItem > 0).toList()
  //       : selectedGroupId.value != 0
  //           ? items.value = totalItem
  //           : items.value = totalItem
  //               .where((e) => e.groupId == selectedGroupId.value)
  //               .toList();

  //   items.refresh();
  //   // If items.value is an ObservableList and needs to be updated
  //   // items.value = items.value;
  // }

  Future<void> itemWithQuantity() async {
    isItemWithOperationQuantity.value = !isItemWithOperationQuantity.value;

    final filterCondition = isItemWithOperationQuantity.value
        ? (ItemUI e) => e.allQuantityOfItem > 0
        : (ItemUI e) => true;

    items.value = selectedGroupId.value != 0
        ? totalItem
            .where((ItemUI e) =>
                e.groupId == selectedGroupId.value && filterCondition(e))
            .toList()
        : totalItem.where(filterCondition).toList();

    itemStatus.value = items.isEmpty ? RxStatus.empty() : RxStatus.success();
  }

  Future<Uint8List?> getItemImage(int id) async {
    final res = await getItemImageUsecase.call(Params(id));

    return res.fold(
      (failure) => null, // Handle failure and return null
      (imageData) => imageData, // Handle success and return the image data
    );
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
    itemStatus.value = items.isNotEmpty ? RxStatus.success() : RxStatus.empty();
  }

  Future<StoreItemDetailsEntity> getItemStoreDetails(ItemUI item) async {
    final selectedItemWithDetails = storeController.allItemsWithDetails.value
        .firstWhere((e) => e.item.id == item.id);
    return selectedItemWithDetails;
  }

  Future<void> filterItemsBySearch(String name) async {
    if (name.trim().isNotEmpty) {
      items.value = items.where((e) => e.name.contains(name)).toList();
      // itemStatus.value =
      //     items.isNotEmpty ? RxStatus.success() : RxStatus.empty();
    } else {
      items.value = totalItem;
    }

    itemStatus.value = items.isNotEmpty ? RxStatus.success() : RxStatus.empty();
  }

  void updatedUnitId(int unitHash, int newIndex) {
    selectedUnit[unitHash]?.value = newIndex;
  }

  // Get the selected price for the given unit hash
  UnitDetailsUI getSelectedUnit(int unitHash, List<UnitDetailsUI> unitDetails) {
    int index = selectedUnitIndex[unitHash]?.value ?? 0;
    return unitDetails[index];
  }

  // ItemStatus get currentStatus {
  //   if (itemStatus.value.isEmpty) return ItemStatus.empty;
  //   if (itemStatus.value.isLoading) return ItemStatus.loading;
  //   if (itemStatus.value.isSuccess) return ItemStatus.success;
  //   if (itemStatus.value.isError) return ItemStatus.error;
  //   return ItemStatus.empty; // Default to empty
  // }
  ItemStatus get currentStatus {
    if (itemStatus.value.isEmpty) return ItemStatus.empty;
    if (itemStatus.value.isLoading) return ItemStatus.loading;
    if (itemStatus.value.isSuccess) return ItemStatus.success;
    if (itemStatus.value.isError) return ItemStatus.error;

    // Log an unexpected state
    debugPrint('Unexpected itemStatus value: $itemStatus');
    return ItemStatus.empty;
  }

  Future<void> getItems1() async {
    // var arguments = Get.arguments as Map<String, dynamic>;

    itemStatus.value = RxStatus.loading();

    List<ItemUI>? updatedItems;
    BillEntity? bill;
    final arguments = Get.arguments;
    if (arguments != null && arguments is Map<String, dynamic>) {
      updatedItems = arguments["updatedItems"] as List<ItemUI>?;
      bill = arguments["bill"] as BillEntity?;
    } else {
      updatedItems = null;
      bill = null;
    }
    items.clear();
    if (storeController.allItems.value.isEmpty) {
      await storeController.getAllStoreInfo();
    }

    final storeItems = storeController.allItems;
    final units = storeController.units;
    final itemUnits = storeController.allItemsUnits;
    final operations = storeController.allStoreOperations;
    groups.value = storeController.allItemGroups.value;
    for (var item in storeItems.value) {
      final unitsDetails = <UnitDetailsUI>[].obs;
      final newItemUnits = itemUnits.value.where((e) => e.itemId == item.id);

      if (newItemUnits.isNotEmpty) {
        for (var itemUint in newItemUnits) {
          final newUnit =
              units.value.firstWhere((e) => e.id == itemUint.itemUnitId);

          int quantity = operations.value
              .where((e) => e.itemId == item.id && e.unitId == newUnit.id)
              .fold(0, (pre, el) => pre + el.quantity);
          UnitDetailsUI? oldUnitDetails;
          if (updatedItems != null) {
            for (var oldItem in updatedItems) {
              for (var oldUnit in oldItem.unitDetails) {
                if (oldUnit.id == itemUint.id) {
                  oldUnitDetails = oldUnit;

                  break;
                }
              }
            }
          }
          final ud = UnitDetailsUI(
              // constantQuantity: quantity,
              backQuantity: oldUnitDetails?.backQuantity ?? 0,
              preDiscount: itemUint.itemDiscount,
              note: oldUnitDetails?.note ?? '',
              discountPercent: oldUnitDetails?.discountPercent ?? 0,
              discount: oldUnitDetails?.discount ?? 0,
              taxPercent: oldUnitDetails?.taxPercent ?? 0,
              intialCost: itemUint.intialCost,
              freeQuantity: oldUnitDetails?.freeQuantity ?? 0,
              updatedQuantity: oldUnitDetails?.updatedQuantity ?? 0,
              id: itemUint.id,
              name: newUnit.name,
              quantityRemaining: (quantity +
                      (billType.value == 8
                          ? 0
                          : (oldUnitDetails?.backQuantity ?? 0)))
                  .abs(),
              totalPrice: oldUnitDetails?.totalPrice ?? 0,
              tax: oldUnitDetails?.tax ?? 0,
              price: itemUint.retailPrice,
              selectedPrice: itemUint.retailPrice,
              firstPrice: itemUint.retailPrice,
              secondPrice: itemUint.spacialPrice,
              thirdPrice: itemUint.wholeSaleprice,
              unitFactor: itemUint.unitFactor);

          // if (ud.quantityRemaining > 0 || (ud.backQuantity! > 0)) {
          //   unitsDetails.add(ud);
          // }
          if (ud.quantityRemaining > 0 ||
              (ud.backQuantity! > 0) ||
              billType.value == 9) {
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

        ItemUI? oldItem;
        if (updatedItems != null) {
          oldItem = updatedItems.firstWhereOrNull((e) => e.id == item.id);
        }

        final newItem = ItemUI(
          hasTax: item.hasTax,
          preTax: item.taxRate,
          allQuantityOfItem: totalQuantity,
          clearPrice: oldItem?.clearPrice ?? 0,
          id: item.id,
          name: item.name,
          image: item.itemImage,
          unitDetails: unitsDetails,
          selectedUnit: unitsDetails.firstWhere((e) => e.unitFactor == 1),
          indexOfUnitDetails: 0,
          groupId: item.itemGroupId,
        );
        totalItem.add(newItem);

        items.value = totalItem;
      }
    }

    if (updatedItems != null) {
      card.value = CardUI(
          items: items
              .where((e) =>
                  e.unitDetails
                      .firstWhereOrNull((e) => e.updatedQuantity > 0) !=
                  null)
              .toList(),
          addedDiscount: bill?.billDiscount ?? 0,
          addedTax: bill?.totalVat ?? 0);

      card.refresh();
    }

    // await storeController.getAllItemsWithDetails();
    itemStatus.value = items.isNotEmpty ? RxStatus.success() : RxStatus.empty();
  }

  // Utility method for grouping a list by a key
  Map<K, List<V>> groupBy<K, V>(List<V> list, K Function(V) keyFunction) {
    final Map<K, List<V>> map = {};
    for (var element in list) {
      final key = keyFunction(element);
      map.putIfAbsent(key, () => []).add(element);
    }
    return map;
  }

  Future<void> getItems() async {
    itemStatus.value = RxStatus.loading();

    // Retrieve arguments
    final arguments = Get.arguments;
    final updatedItems = arguments != null && arguments is Map<String, dynamic>
        ? arguments["updatedItems"] as List<ItemUI>?
        : null;
    final bill = arguments != null && arguments is Map<String, dynamic>
        ? arguments["bill"] as BillEntity?
        : null;

    items.clear();

    // Ensure all store data is loaded
    if (storeController.allItems.value.isEmpty) {
      await storeController.getAllStoreInfo();
    }

    final storeItems = storeController.allItems.value;
    final unitsMap = {
      for (var unit in storeController.units.value) unit.id: unit
    };

    final itemUnitsMap =
        groupBy(storeController.allItemsUnits.value, (unit) => unit.itemId);
    final operationsMap =
        groupBy(storeController.allStoreOperations.value, (op) => op.itemId);

    groups.value = storeController.allItemGroups.value;
    final updatedItemsMap = updatedItems?.asMap() ?? {};
    // final List<ItemUI> totalItem = [];

    for (var item in storeItems) {
      final unitsDetails = <UnitDetailsUI>[];
      final newItemUnits = itemUnitsMap[item.id] ?? [];
      final operationsForItem = operationsMap[item.id] ?? [];

      for (var itemUnit in newItemUnits) {
        final unit = unitsMap[itemUnit.itemUnitId];
        if (unit == null) continue;

        final totalQuantity = operationsForItem
            .where((op) => op.unitId == unit.id)
            .fold(0, (sum, op) => sum + op.quantity);

        final oldUnitDetails = updatedItemsMap[item.id]
            ?.unitDetails
            .firstWhereOrNull((oldUnit) => oldUnit.id == itemUnit.id);

        final quantityRemaining = (totalQuantity +
                (billType.value == 8 ? 0 : (oldUnitDetails?.backQuantity ?? 0)))
            .abs();

        if (quantityRemaining > 0 ||
            (oldUnitDetails?.backQuantity ?? 0) > 0 ||
            billType.value == 9) {
          unitsDetails.add(UnitDetailsUI(
            backQuantity: oldUnitDetails?.backQuantity ?? 0,
            preDiscount: itemUnit.itemDiscount,
            note: oldUnitDetails?.note ?? '',
            discountPercent: oldUnitDetails?.discountPercent ?? 0,
            discount: oldUnitDetails?.discount ?? 0,
            taxPercent: oldUnitDetails?.taxPercent ?? 0,
            intialCost: itemUnit.intialCost,
            freeQuantity: oldUnitDetails?.freeQuantity ?? 0,
            updatedQuantity: oldUnitDetails?.updatedQuantity ?? 0,
            id: itemUnit.id,
            name: unit.name,
            quantityRemaining: quantityRemaining,
            totalPrice: oldUnitDetails?.totalPrice ?? 0,
            tax: oldUnitDetails?.tax ?? 0,
            price: itemUnit.retailPrice,
            selectedPrice: itemUnit.retailPrice,
            firstPrice: itemUnit.retailPrice,
            secondPrice: itemUnit.spacialPrice,
            thirdPrice: itemUnit.wholeSaleprice,
            unitFactor: itemUnit.unitFactor,
          ));
        }
      }

      if (unitsDetails.isNotEmpty) {
        final totalQuantity = unitsDetails.fold(
            0,
            (sum, detail) =>
                sum + (detail.quantityRemaining * detail.unitFactor));

        for (var detail in unitsDetails) {
          detail.quantityRemaining = totalQuantity ~/ detail.unitFactor;
        }

        final oldItem = updatedItemsMap[item.id];

        totalItem.add(ItemUI(
          hasTax: item.hasTax,
          preTax: item.taxRate,
          allQuantityOfItem: totalQuantity,
          clearPrice: oldItem?.clearPrice ?? 0,
          id: item.id,
          name: item.name,
          image: item.itemImage,
          unitDetails: unitsDetails,
          selectedUnit: unitsDetails.firstWhere((e) => e.unitFactor == 1),
          indexOfUnitDetails: 0,
          groupId: item.itemGroupId,
        ));
      }
    }

    items.value = totalItem;

    if (updatedItems != null) {
      card.value = CardUI(
        items: items
            .where((e) =>
                e.unitDetails.any((detail) => detail.updatedQuantity > 0))
            .toList(),
        addedDiscount: bill?.billDiscount ?? 0,
        addedTax: bill?.totalVat ?? 0,
      );
      card.refresh();
    }

    itemStatus.value = items.isNotEmpty ? RxStatus.success() : RxStatus.empty();
  }

  void nextUnitDetails(ItemUI item) {
    // Find the current item index based on the ID
    int currentIndex =
        item.unitDetails.indexWhere((unit) => unit.id == item.selectedUnit.id);

    if (currentIndex != -1 && currentIndex < item.unitDetails.length - 1) {
      // Move to the next item's ID
      item.selectedUnit = item.unitDetails[currentIndex + 1];
    } else {
      // If it's the last item, loop back to the first item's ID
      item.selectedUnit = item.unitDetails[0];
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

    // updatedItem.itemTotalPrice = unitDetails.selectedPrice;

    refreshItemCardInfo(updatedItem);

    updatePercentWhenPriceChange(updatedItem);

    refreshItemCardInfo(updatedItem);

    items.refresh();
  }

  void updatePreTaxForItem(ItemUI updatedItem) {
    updatedItem.selectedUnit.taxPercent =
        double.parse(updatedItem.preTax.toString());

    taxPercentTextEditing.value.text =
        updatedItem.selectedUnit.taxPercent.toString();

    taxRateTextEditing.value.text = (updatedItem.selectedUnit.totalPrice *
            updatedItem.selectedUnit.taxPercent /
            100)
        .toStringAsFixed(2);
    updatedItem.selectedUnit.tax = double.parse(taxRateTextEditing.value.text);
  }

  void updatePercentWhenPriceChange(ItemUI updatedItem) {
    if (updatedItem.selectedUnit.discountPercent > 0 &&
        updatedItem.selectedUnit.discountPercent <=
            updatedItem.selectedUnit.preDiscount) {
      discountRateTextEditing.value.clear();
      discountRateTextEditing.value.text =
          (updatedItem.selectedUnit.totalPrice *
                  updatedItem.selectedUnit.discountPercent /
                  100)
              .toStringAsFixed(2);
      updatedItem.selectedUnit.discount = percentToRate(
          updatedItem.selectedUnit.discountPercent,
          updatedItem.selectedUnit.totalPrice);
    }
    if (updatedItem.selectedUnit.taxPercent >= 0) {
      taxRateTextEditing.value.clear();
      taxRateTextEditing.value.text = (updatedItem.selectedUnit.totalPrice *
              updatedItem.selectedUnit.taxPercent /
              100)
          .toStringAsFixed(2);
      updatedItem.selectedUnit.tax =
          double.parse(taxRateTextEditing.value.text);
    }

    if (updatedItem.selectedUnit.updatedQuantity == 0) {
      updatedItem.selectedUnit.discount = 0;
      // updatedItem.selectedUnit.discountPercent = 0;
      updatedItem.selectedUnit.totalPrice = 0;
      // discountPercentTextEditing.value.clear();
      discountRateTextEditing.value.clear();
    }
  }

  void refreshTextEditingControllers(ItemUI item) {
    if (item.selectedUnit.discount <= 0) {
      discountPercentTextEditing.value.clear();
      discountRateTextEditing.value.clear();
    } else {
      discountRateTextEditing.value.text =
          item.selectedUnit.discount.toString();
      discountPercentTextEditing.value.text =
          item.selectedUnit.discountPercent.toStringAsFixed(2);
    }
  }

  void changeUnit(value, item) {
    items
        .firstWhere(
          (element) => element.id == item.id,
        )
        .selectedUnit = value ?? item.unitDetails[0];
    updatePreTaxForItem(item);
    refreshItemCardInfo(item);
    refreshTextEditingControllers(item);
  }

  void updateQuantity(int itemId, int quantity, int freeQuntity) {
    ItemUI updatedItem = items.firstWhere((e) => e.id == itemId);
    freeQuntity = billType.value == 8 ? freeQuntity : -freeQuntity;

    if (quantity == 1) {
      if (updatedItem.selectedUnit.quantityRemaining > 0 &&
          billType.value != 9) {
        updatedItem.selectedUnit.updatedQuantity += quantity;
        updatedItem.selectedUnit.quantityRemaining -= quantity;

        // //update
        updatedQuantitiesForItem(
            quantity, updatedItem, updatedItem.selectedUnit);
        refreshItemCardInfo(updatedItem);
        // }
      } else if (billType.value == 9) {
        updatedItem.selectedUnit.updatedQuantity += quantity;
        updatedItem.selectedUnit.quantityRemaining -= quantity;

        // //update
        updatedItem.allQuantityOfItem = updatedItem.allQuantityOfItem +
            quantity * updatedItem.selectedUnit.unitFactor;

        for (var e in updatedItem.unitDetails) {
          e.quantityRemaining = 0;
          e.quantityRemaining = updatedItem.allQuantityOfItem ~/ e.unitFactor;
          // e.constantQuantity = updatedItem.allQuantityOfItem ~/ e.unitFactor;
        }
      }
    } else if (quantity == -1) {
      if (billType.value != 9) {
        updatedItem.selectedUnit.updatedQuantity += quantity;
        updatedItem.selectedUnit.quantityRemaining -= quantity;

        updatedItem.allQuantityOfItem = updatedItem.allQuantityOfItem -
            quantity * updatedItem.selectedUnit.unitFactor;

        for (var e in updatedItem.unitDetails) {
          e.quantityRemaining = 0;
          e.quantityRemaining = updatedItem.allQuantityOfItem ~/ e.unitFactor;
        }
      } else {
        updatedItem.selectedUnit.updatedQuantity += quantity;
        updatedItem.selectedUnit.quantityRemaining -= quantity;

        updatedItem.allQuantityOfItem = updatedItem.allQuantityOfItem +
            quantity * updatedItem.selectedUnit.unitFactor;

        for (var e in updatedItem.unitDetails) {
          e.quantityRemaining = 0;
          e.quantityRemaining = updatedItem.allQuantityOfItem ~/ e.unitFactor;
        }
      }

      refreshItemCardInfo(updatedItem);
      refreshTextEditingControllers(updatedItem);
    }

    if (freeQuntity == 1) {
      if (updatedItem.selectedUnit.quantityRemaining > 0) {
        updatedItem.selectedUnit.freeQuantity += billType.value == 8 ? 1 : -1;

        // updatedItem.selectedUnit.freeQuantity += freeQuntity;
        updatedItem.selectedUnit.quantityRemaining -= freeQuntity;

        //update quantities
        updatedQuantitiesForItem(
            freeQuntity, updatedItem, updatedItem.selectedUnit);
        refreshItemCardInfo(updatedItem);
      }
    } else if (freeQuntity == -1) {
      // if (billType.value == 8) {
      updatedItem.selectedUnit.freeQuantity -= billType.value == 8 ? 1 : -1;
      updatedItem.selectedUnit.quantityRemaining -= freeQuntity;

      //update quantities
      updatedQuantitiesForItem(
        freeQuntity,
        updatedItem,
        updatedItem.selectedUnit,
      );
    }

    updatePercentWhenPriceChange(updatedItem);
    refreshItemCardInfo(updatedItem);
  }

  bool isNumber(String input) {
    return num.tryParse(input) != null;
  }

  void updateQuantityFromTextField(String value, ItemUI item) {
    int res;
    if (!isNumber(value) || value.trim().isEmpty) {
      res = 0;
    } else {
      res = int.parse(value);
    }

    if ((res > item.selectedUnit.quantityRemaining && billType.value == 8) ||
        res < 0) {
      res = 0;
    }

    int updatedQuantity = (res - item.selectedUnit.updatedQuantity).toInt();

    if (updatedQuantity > 0) {
      for (var i = 0; i < updatedQuantity; i++) {
        updateQuantity(item.id, 1, 0);
      }
    } else {
      for (var i = updatedQuantity; i < 0; i++) {
        updateQuantity(item.id, -1, 0);
      }
    }
  }

  void updatedQuantitiesForItem(
      int quantity, ItemUI updatedItem, UnitDetailsUI selectedUnit) {
    if (updatedItem.allQuantityOfItem >= selectedUnit.unitFactor) {
      updatedItem.allQuantityOfItem =
          updatedItem.allQuantityOfItem - quantity * selectedUnit.unitFactor;

      for (var e in updatedItem.unitDetails) {
        e.quantityRemaining = 0;
        e.quantityRemaining = updatedItem.allQuantityOfItem ~/ e.unitFactor;
        // e.constantQuantity = updatedItem.allQuantityOfItem ~/ e.unitFactor;
      }
    }
  }

  void clearTextEditingController({required bool isDiscount}) {
    if (isDiscount) {
      discountRateTextEditing.value.clear();
      discountPercentTextEditing.value.clear();
    } else {
      taxPercentTextEditing.value.clear();
      taxRateTextEditing.value.clear();
    }
  }

  void refreshItemCardInfo(ItemUI updatedItem) {
    updatedItem.selectedUnit.totalPrice =
        updatedItem.selectedUnit.selectedPrice *
            updatedItem.selectedUnit.updatedQuantity;

    //caculated Discount
    updatedItem.clearPrice = updatedItem.unitDetails
        .map((unit) => unit.clearPrice)
        .reduce((value, element) => value + element);

    //update cart
    if (updatedItem.unitDetails.any((item) => item.updatedQuantity > 0)) {
      if (!card.value!.items.contains(updatedItem)) {
        card.value!.items.add(updatedItem);
      } else {
        int index = card.value!.items.indexWhere((e) => e.id == updatedItem.id);
        card.value!.items[index] = updatedItem;
      }
    } else {
      card.value!.items.remove(updatedItem);
      CustomDialog.customSnackBar(
        'تم حذف المنتج من السلة',
        SnackPosition.TOP,
        false,
      );
      if (Get.isDialogOpen ?? false) {
        Get.back();
      }
    }

    items.refresh();
    card.refresh();
  }
}
