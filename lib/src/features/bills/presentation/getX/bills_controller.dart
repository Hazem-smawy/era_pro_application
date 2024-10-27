// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';
// import 'dart:typed_data';

import 'package:drift/drift.dart';
import 'package:era_pro_application/src/features/store/domain/entities/store_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:era_pro_application/src/features/store/presentation/getX/store_controller.dart';

class Bill {
  int numberOfItems;
  double totalPrice;
  String customerName;
  double addTaxPercent;
  double addTaxRate;
  double addDiscountPercent;
  double addDiscountRate;
  double clearPrice;
  double tax;
  double discount;
  int typeOfPay;
  String note;
  Bill({
    this.numberOfItems = 0,
    this.totalPrice = 0,
    this.customerName = '',
    this.addTaxPercent = 0,
    this.addTaxRate = 0,
    this.addDiscountPercent = 0,
    this.addDiscountRate = 0,
    this.clearPrice = 0,
    this.tax = 0,
    this.discount = 0,
    this.typeOfPay = 0,
    this.note = '',
  });
}

class Item {
  int id;
  String name;
  // int quantity;
  Uint8List? image;

  List<UnitDetails> unitDetails;

  String note;
  UnitDetails selectedUnit;
  UnitDetails smallUnit;
  double discountRate;
  double discountPercent;
  double taxRate;
  double taxPercent;
  double totalPrice;
  double totalPriceWithTaxRate;
  double totalPriceWithTaxPercent;
  double totalPriceWithDiscountRate;
  double totalPriceWithDiscountPercent;
  double clearPrice;
  int allQuantityOfItem;
  double totalPriceBeforeDiscountAndTax;
  int freeUnitId;
  int indexOfUnitDetails;
  int groupId;

  Item({
    required this.id,
    required this.name,
    required this.totalPriceBeforeDiscountAndTax,
    required this.smallUnit,
    required this.image,
    required this.unitDetails,
    required this.note,
    required this.selectedUnit,
    required this.discountPercent,
    required this.discountRate,
    required this.taxPercent,
    required this.taxRate,
    required this.freeUnitId,
    this.totalPriceWithDiscountPercent = 0,
    this.totalPriceWithDiscountRate = 0,
    this.totalPriceWithTaxPercent = 0,
    this.totalPriceWithTaxRate = 0,
    this.totalPrice = 0,
    this.clearPrice = 0,
    required this.allQuantityOfItem,
    required this.indexOfUnitDetails,
    required this.groupId,
  });
}

class UnitDetails {
  int id;
  String name;
  double price;
  int updatedQuantity;
  double totalPrice;
  double taxRate;
  double taxPercent;
  double selectedPrice;
  double firstPrice;
  double secondPrice;
  double thirdPrice;
  int unitFactor;
  int quantityRemaining;
  // int constantQuantity;
  int freeQuantity;

  UnitDetails({
    required this.id,
    required this.name,
    required this.quantityRemaining,
    this.price = 0.0,
    required this.unitFactor,
    required this.updatedQuantity,
    required this.totalPrice,
    required this.taxRate,
    required this.taxPercent,
    required this.selectedPrice,
    required this.firstPrice,
    required this.secondPrice,
    required this.thirdPrice,
    required this.freeQuantity,
    // required this.constantQuantity,
  });
}

class ItemController extends GetxController {
  var items = <Item>[].obs;
  var totalItem = <Item>[].obs;
  var cart = <Item>[].obs;
  var groups = <ItemGroupEntity>[].obs;
  StoreController storeController = Get.find();
  var selectedUnit = <int, Rx<int>>{}.obs;
  var selectedUnitIndex = <int, RxInt>{}.obs;
  var selectedGroupId = 0.obs;

  TextEditingController itemDetailsPriceController = TextEditingController();
  TextEditingController customerName = TextEditingController();
  TextEditingController billNote = TextEditingController();
  var newBill = Rx<Bill?>(null);

  @override
  void onInit() {
    super.onInit();
    getItems();
    newBill.value = Bill();
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
  UnitDetails getSelectedUnit(int unitHash, List<UnitDetails> unitDetails) {
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
      final unitsDetails = <UnitDetails>[].obs;
      final newItemUnits = itemUnits.where((e) => e.itemId == item.id);

      if (newItemUnits.isNotEmpty) {
        for (var itemUint in newItemUnits) {
          final newUnit = units.firstWhere((e) => e.id == itemUint.itemUnitId);

          int quantity = operations
              .where((e) => e.itemId == item.id && e.unitId == newUnit.id)
              .fold(0, (pre, el) => pre + el.quantity);

          final ud = UnitDetails(
              // constantQuantity: quantity,
              freeQuantity: 0,
              updatedQuantity: 0,
              id: itemUint.id,
              name: newUnit.name,
              quantityRemaining: quantity,
              totalPrice: 0,
              taxRate: 0,
              taxPercent: 0,
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

        final newItem = Item(
          freeUnitId: unitsDetails.firstWhere((e) => e.unitFactor == 1).id,
          totalPriceBeforeDiscountAndTax: 0,
          allQuantityOfItem: totalQuantity,
          id: item.id,
          name: item.name,
          image: item.itemImage,
          unitDetails: unitsDetails,
          smallUnit: unitsDetails.firstWhere((e) => e.unitFactor == 1),
          note: '',
          selectedUnit: unitsDetails.firstWhere((e) => e.unitFactor == 1),
          discountPercent: 0,
          discountRate: 0,
          taxPercent: 0,
          taxRate: 0,
          totalPrice: 0,
          indexOfUnitDetails: 0,
          groupId: item.itemGroupId,
        );
        totalItem.add(newItem);

        items.value = totalItem;
      }
    }
  }

  void nextUnitDetails(Item item) {
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
    // refreshItemBillInfo(item);
  }

  Future updateSelectedPrice(int itemId, int itemUnitId, int number) async {
    final itemUnits = await storeController.getAllItemsUnit();

    Item updatedItem = items.firstWhere((e) => e.id == itemId);
    final selectedItemUnit = itemUnits.firstWhere((e) => e.id == itemUnitId);
    UnitDetails unitDetails =
        updatedItem.unitDetails.firstWhere((e) => e.id == selectedItemUnit.id);
    if (number == 1) {
      unitDetails.selectedPrice = unitDetails.firstPrice;
    } else if (2 == number) {
      unitDetails.selectedPrice = unitDetails.secondPrice;
    } else {
      unitDetails.selectedPrice = unitDetails.thirdPrice;
    }

    updatedItem.totalPrice = unitDetails.selectedPrice;

    refreshItemBillInfo(updatedItem);

    items.refresh();
  }

  void updateQuantity(int itemId, int quantity, int freeQuntity) {
    Item updatedItem = items.firstWhere((e) => e.id == itemId);
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
    } else if (updatedItem.selectedUnit.id != freeUnit.id) {
      if (freeQuntity == 1) {
        if (freeUnit.quantityRemaining > 0) {
          freeUnit.freeQuantity += 1;
          freeUnit.quantityRemaining -= 1;
          int index =
              updatedItem.unitDetails.indexWhere((e) => e.id == freeUnit.id);

          updatedItem.unitDetails[index] = freeUnit;
          //update quantities
          updatedQuantitiesForItem(freeQuntity, updatedItem, freeUnit);
          refreshItemBillInfo(updatedItem);
        }
      } else if (freeQuntity == -1) {
        freeUnit.freeQuantity -= 1;
        freeUnit.quantityRemaining += 1;
        int index =
            updatedItem.unitDetails.indexWhere((e) => e.id == freeUnit.id);

        updatedItem.unitDetails[index] = freeUnit;

        //update quantities
        updatedItem.allQuantityOfItem = updatedItem.allQuantityOfItem +
            1 * updatedItem.unitDetails[index].unitFactor;

        for (var e in updatedItem.unitDetails) {
          e.quantityRemaining = 0;
          e.quantityRemaining = updatedItem.allQuantityOfItem ~/ e.unitFactor;
        }
        refreshItemBillInfo(updatedItem);
      }
    }

    //free quantity
    // if (freeUnit.id != updatedItem.selectedUnit.id) {
    //   if (freeQuntity == 1) {
    //     if (freeUnit.freeQuantity < freeUnit.quantityRemaining) {
    //       freeUnit.freeQuantity += freeQuntity;
    //       freeUnit.quantityRemaining -= freeQuntity;
    //     }
    //   } else {
    //     freeUnit.freeQuantity += freeQuntity;
    //     freeUnit.quantityRemaining += freeQuntity;
    //   }

    //   int index =
    //       updatedItem.unitDetails.indexWhere((e) => e.id == freeUnit.id);
    //   updatedItem.unitDetails[index] = freeUnit;
    // }
    // if (freeUnit.id == updatedItem.selectedUnit.id) {
    //   updatedItem.selectedUnit.freeQuantity = freeUnit.freeQuantity;
    //   updatedItem.selectedUnit.quantityRemaining =
    //       print('object ${updatedItem.selectedUnit.freeQuantity}');
    // }
  }

  void updatedQuantitiesForItem(
      int quantity, Item updatedItem, UnitDetails selectedUnit) {
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

  void refreshItemBillInfo(Item updatedItem) {
    updatedItem.selectedUnit.totalPrice =
        updatedItem.selectedUnit.selectedPrice *
            updatedItem.selectedUnit.updatedQuantity;

    updatedItem.totalPriceBeforeDiscountAndTax = updatedItem.unitDetails
        .map((unit) => unit.totalPrice)
        .reduce((value, element) => value + element);

    //caculated Discount
    updatedItem.totalPriceWithDiscountPercent =
        updatedItem.totalPriceBeforeDiscountAndTax *
            updatedItem.discountPercent;

    updatedItem.totalPriceWithDiscountRate = updatedItem.discountRate;

    //caculated TAX
    updatedItem.clearPrice = updatedItem.totalPrice -
        updatedItem.totalPriceWithTaxPercent -
        updatedItem.totalPriceWithTaxRate;
    updatedItem.totalPriceWithTaxPercent =
        (updatedItem.totalPrice * updatedItem.taxPercent);

    // clear Price
    updatedItem.clearPrice = updatedItem.totalPriceBeforeDiscountAndTax -
        updatedItem.totalPriceWithTaxPercent -
        updatedItem.totalPriceWithTaxRate -
        updatedItem.totalPriceWithDiscountRate -
        updatedItem.totalPriceWithDiscountPercent;

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

    newBill.value?.tax = cart.fold(
        0,
        (prevValue, item) =>
            prevValue +
            item.totalPriceWithTaxRate +
            item.totalPriceWithTaxPercent);
    newBill.value?.discount = cart.fold(
        0,
        (prevValue, item) =>
            prevValue +
            item.totalPriceWithDiscountRate +
            item.totalPriceWithDiscountPercent);

    updateBill();

    items.refresh();
    cart.refresh();
  }

  void updateBill() {
    newBill.value?.clearPrice = newBill.value!.totalPrice -
        newBill.value!.addDiscountPercent * newBill.value!.totalPrice -
        newBill.value!.addDiscountRate -
        newBill.value!.addTaxPercent * newBill.value!.totalPrice -
        newBill.value!.addTaxRate;

    newBill.refresh();
  }
}
