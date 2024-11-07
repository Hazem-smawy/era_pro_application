// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:flutter/foundation.dart';

class BillUI {
  int numberOfItems;
  double totalPrice;

  int customerNumber;
  double addedTax;
  double addedDiscount;
  double clearPrice;
  double tax;
  double discount;
  int typeOfPay;
  String note;
  DateTime? dueDate;

  BillUI({
    this.numberOfItems = 0,
    this.totalPrice = 0,
    this.customerNumber = 0,
    this.addedTax = 0,
    this.addedDiscount = 0,
    this.clearPrice = 0,
    this.tax = 0,
    this.discount = 0,
    this.typeOfPay = 0,
    this.note = '',
  });
}

class ItemUI {
  int id;
  String name;
  Uint8List? image;

  List<UnitDetailsUI> unitDetails;
  UnitDetailsUI selectedUnit;
  UnitDetailsUI smallUnit;

  double itemTotalPrice;

  double clearPrice;
  int allQuantityOfItem;
  int freeUnitId;
  int indexOfUnitDetails;
  int groupId;

  ItemUI({
    required this.id,
    required this.name,
    required this.image,
    required this.unitDetails,
    required this.selectedUnit,
    required this.smallUnit,
    this.itemTotalPrice = 0,
    this.clearPrice = 0,
    required this.allQuantityOfItem,
    required this.freeUnitId,
    required this.indexOfUnitDetails,
    required this.groupId,
  });

  double get tax {
    return unitDetails.fold(0, (prev, value) => prev + value.tax);
  }

  double get taxPercent {
    return unitDetails.fold(0, (prev, value) => prev + value.taxPercent);
  }

  double get discount {
    return unitDetails.fold(0, (prev, value) => prev + value.discount);
  }

  double get discountPercent {
    return unitDetails.fold(0, (prev, value) => prev + value.discountPercent);
  }

  ItemUI copyWith({
    int? id,
    String? name,
    Uint8List? image,
    List<UnitDetailsUI>? unitDetails,
    UnitDetailsUI? selectedUnit,
    UnitDetailsUI? smallUnit,
    double? itemTotalPrice,
    double? clearPrice,
    int? allQuantityOfItem,
    int? freeUnitId,
    int? indexOfUnitDetails,
    int? groupId,
  }) {
    return ItemUI(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      unitDetails: unitDetails ?? this.unitDetails,
      selectedUnit: selectedUnit ?? this.selectedUnit,
      smallUnit: smallUnit ?? this.smallUnit,
      itemTotalPrice: itemTotalPrice ?? this.itemTotalPrice,
      clearPrice: clearPrice ?? this.clearPrice,
      allQuantityOfItem: allQuantityOfItem ?? this.allQuantityOfItem,
      freeUnitId: freeUnitId ?? this.freeUnitId,
      indexOfUnitDetails: indexOfUnitDetails ?? this.indexOfUnitDetails,
      groupId: groupId ?? this.groupId,
    );
  }

  @override
  String toString() {
    return 'ItemUI(id: $id, name: $name, image: $image, unitDetails: $unitDetails, selectedUnit: $selectedUnit, smallUnit: $smallUnit, itemTotalPrice: $itemTotalPrice, clearPrice: $clearPrice, allQuantityOfItem: $allQuantityOfItem, freeUnitId: $freeUnitId, indexOfUnitDetails: $indexOfUnitDetails, groupId: $groupId)';
  }

  @override
  bool operator ==(covariant ItemUI other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.image == image &&
        listEquals(other.unitDetails, unitDetails) &&
        other.selectedUnit == selectedUnit &&
        other.smallUnit == smallUnit &&
        other.itemTotalPrice == itemTotalPrice &&
        other.clearPrice == clearPrice &&
        other.allQuantityOfItem == allQuantityOfItem &&
        other.freeUnitId == freeUnitId &&
        other.indexOfUnitDetails == indexOfUnitDetails &&
        other.groupId == groupId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        image.hashCode ^
        unitDetails.hashCode ^
        selectedUnit.hashCode ^
        smallUnit.hashCode ^
        itemTotalPrice.hashCode ^
        clearPrice.hashCode ^
        allQuantityOfItem.hashCode ^
        freeUnitId.hashCode ^
        indexOfUnitDetails.hashCode ^
        groupId.hashCode;
  }
}

class UnitDetailsUI {
  int id;
  String name;
  double price;
  int updatedQuantity;
  double totalPrice;

  double discount;
  double discountPercent;
  double tax;
  double taxPercent;
  double selectedPrice;
  double firstPrice;
  double secondPrice;
  double thirdPrice;
  int unitFactor;
  int quantityRemaining;
  // int constantQuantity;
  int freeQuantity;
  double intialCost;
  String note;

  UnitDetailsUI({
    required this.note,
    required this.id,
    required this.name,
    required this.quantityRemaining,
    required this.intialCost,
    this.price = 0.0,
    required this.unitFactor,
    required this.updatedQuantity,
    required this.totalPrice,
    required this.discount,
    required this.tax,
    required this.discountPercent,
    required this.taxPercent,
    required this.selectedPrice,
    required this.firstPrice,
    required this.secondPrice,
    required this.thirdPrice,
    required this.freeQuantity,
    // required this.constantQuantity,
  });

  double get clearPrice => totalPrice + tax - discount;
}
