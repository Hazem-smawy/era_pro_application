// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:era_pro_application/src/features/bills/domain/entities/bill_details_entity.dart';

class BillUI {
  int? billId;
  int? billNumber;
  int numberOfItems;
  double totalPrice;

  int customerNumber;
  double addedTax;
  double addedTaxPercent;
  double addedDiscount;
  // double oldTaxPercent;
  // double clearPrice;
  double tax;
  double discount;
  int typeOfPay;
  String note;
  DateTime? dueDate;
  int type;
  bool isOld;
  int? selectedCurencyId;

  BillUI({
    this.billId,
    this.billNumber,
    this.numberOfItems = 0,
    this.totalPrice = 0,
    this.customerNumber = 0,
    this.addedTax = 0,
    this.addedTaxPercent = 0,
    this.addedDiscount = 0,
    this.tax = 0,
    this.discount = 0,
    this.typeOfPay = 0,
    this.note = '',
    this.dueDate,
    this.type = 0,
    this.isOld = false,
    this.selectedCurencyId,
  });
  double get clearPrice => totalPrice - addedDiscount + addedTax;
  double get netBill => totalPrice - addedDiscount - discount;
  BillUI copyWith({
    int? billId,
    int? billNumber,
    int? numberOfItems,
    double? totalPrice,
    int? customerNumber,
    double? addedTax,
    double? addedTaxPercent,
    double? addedDiscount,
    double? tax,
    double? discount,
    int? typeOfPay,
    String? note,
    DateTime? dueDate,
    int? type,
    bool? isOld,
    int? selectedCurencyId,
  }) {
    return BillUI(
      billId: billId ?? this.billId,
      billNumber: billNumber ?? this.billNumber,
      numberOfItems: numberOfItems ?? this.numberOfItems,
      totalPrice: totalPrice ?? this.totalPrice,
      customerNumber: customerNumber ?? this.customerNumber,
      addedTax: addedTax ?? this.addedTax,
      addedTaxPercent: addedTaxPercent ?? this.addedTaxPercent,
      addedDiscount: addedDiscount ?? this.addedDiscount,
      tax: tax ?? this.tax,
      discount: discount ?? this.discount,
      typeOfPay: typeOfPay ?? this.typeOfPay,
      note: note ?? this.note,
      dueDate: dueDate ?? this.dueDate,
      type: type ?? this.type,
      isOld: isOld ?? this.isOld,
      selectedCurencyId: selectedCurencyId ?? this.selectedCurencyId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'billId': billId,
      'billNumber': billNumber,
      'numberOfItems': numberOfItems,
      'totalPrice': totalPrice,
      'customerNumber': customerNumber,
      'addedTax': addedTax,
      'addedTaxPercent': addedTaxPercent,
      'addedDiscount': addedDiscount,
      'tax': tax,
      'discount': discount,
      'typeOfPay': typeOfPay,
      'note': note,
      'dueDate': dueDate?.millisecondsSinceEpoch,
      'type': type,
      'isOld': isOld,
      'selectedCurencyId': selectedCurencyId,
    };
  }

  factory BillUI.fromMap(Map<String, dynamic> map) {
    return BillUI(
      billId: map['billId'] != null ? map['billId'] as int : null,
      billNumber: map['billNumber'] != null ? map['billNumber'] as int : null,
      numberOfItems: map['numberOfItems'] as int,
      totalPrice: map['totalPrice'] as double,
      customerNumber: map['customerNumber'] as int,
      addedTax: map['addedTax'] as double,
      addedTaxPercent: map['addedTaxPercent'] as double,
      addedDiscount: map['addedDiscount'] as double,
      tax: map['tax'] as double,
      discount: map['discount'] as double,
      typeOfPay: map['typeOfPay'] as int,
      note: map['note'] as String,
      dueDate: map['dueDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dueDate'] as int)
          : null,
      type: map['type'] as int,
      isOld: map['isOld'] as bool,
      selectedCurencyId: map['selectedCurencyId'] != null
          ? map['selectedCurencyId'] as int
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BillUI.fromJson(String source) =>
      BillUI.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BillUI(billId: $billId, billNumber: $billNumber, numberOfItems: $numberOfItems, totalPrice: $totalPrice, customerNumber: $customerNumber, addedTax: $addedTax, addedTaxPercent: $addedTaxPercent, addedDiscount: $addedDiscount, tax: $tax, discount: $discount, typeOfPay: $typeOfPay, note: $note, dueDate: $dueDate, type: $type, isOld: $isOld, selectedCurencyId: $selectedCurencyId)';
  }

  @override
  bool operator ==(covariant BillUI other) {
    if (identical(this, other)) return true;

    return other.billId == billId &&
        other.billNumber == billNumber &&
        other.numberOfItems == numberOfItems &&
        other.totalPrice == totalPrice &&
        other.customerNumber == customerNumber &&
        other.addedTax == addedTax &&
        other.addedTaxPercent == addedTaxPercent &&
        other.addedDiscount == addedDiscount &&
        other.tax == tax &&
        other.discount == discount &&
        other.typeOfPay == typeOfPay &&
        other.note == note &&
        other.dueDate == dueDate &&
        other.type == type &&
        other.isOld == isOld &&
        other.selectedCurencyId == selectedCurencyId;
  }

  @override
  int get hashCode {
    return billId.hashCode ^
        billNumber.hashCode ^
        numberOfItems.hashCode ^
        totalPrice.hashCode ^
        customerNumber.hashCode ^
        addedTax.hashCode ^
        addedTaxPercent.hashCode ^
        addedDiscount.hashCode ^
        tax.hashCode ^
        discount.hashCode ^
        typeOfPay.hashCode ^
        note.hashCode ^
        dueDate.hashCode ^
        type.hashCode ^
        isOld.hashCode ^
        selectedCurencyId.hashCode;
  }
}

class CardUI {
  List<ItemUI> items;

  double addedDiscount;
  double addedTax;
  CardUI({
    required this.items,
    required this.addedDiscount,
    required this.addedTax,
  });

  List<ItemUI> get itemsWithOneUnit => items.expand((item) {
        return item.unitDetails
            .where((unit) => unit.updatedQuantity > 0 || unit.freeQuantity > 0)
            .map((unit) => item.copyWith(unitDetails: [unit]));
      }).toList();
  int get length => itemsWithOneUnit.length;
  double get totalPrice =>
      items.fold(0, (prevValue, item) => prevValue + item.clearPrice);
  double get tax => items.fold(0, (prevValue, item) => prevValue + item.tax);
  double get discount =>
      items.fold(0, (prevValue, item) => prevValue + item.discount);
  double get clearPrice => totalPrice - addedDiscount + addedTax;
}

class ItemUI {
  int id;
  String name;
  Uint8List? image;

  List<UnitDetailsUI> unitDetails;
  UnitDetailsUI selectedUnit;

  // double itemTotalPrice;

  double clearPrice;
  int allQuantityOfItem;

  int indexOfUnitDetails;
  int groupId;
  int preTax;
  bool hasTax;

  ItemUI({
    required this.id,
    required this.name,
    required this.image,
    required this.unitDetails,
    required this.selectedUnit,
    this.clearPrice = 0,
    required this.allQuantityOfItem,
    required this.indexOfUnitDetails,
    required this.groupId,
    required this.preTax,
    required this.hasTax,
  });

  double get tax {
    return unitDetails.fold(0, (prev, value) => prev + value.tax);
  }

  set tax(value) {
    tax = value;
  }

  double get taxPercent {
    return unitDetails.fold(0, (prev, value) => prev + value.taxPercent);
  }

  set taxPercent(value) {
    taxPercent = value;
  }

  double get discount {
    return unitDetails.fold(0, (prev, value) => prev + value.discount);
  }

  set discount(value) {
    discount = value;
  }

  double get discountPercent {
    return unitDetails.fold(0, (prev, value) => prev + value.discountPercent);
  }

  set discountPercent(value) {
    discountPercent = value;
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
    bool? hasTax,
    int? preTax,
  }) {
    return ItemUI(
      id: id ?? this.id,
      hasTax: hasTax ?? this.hasTax,
      preTax: preTax ?? this.preTax,
      name: name ?? this.name,
      image: image ?? this.image,
      unitDetails: unitDetails ?? this.unitDetails,
      selectedUnit: selectedUnit ?? this.selectedUnit,
      clearPrice: clearPrice ?? this.clearPrice,
      allQuantityOfItem: allQuantityOfItem ?? this.allQuantityOfItem,
      indexOfUnitDetails: indexOfUnitDetails ?? this.indexOfUnitDetails,
      groupId: groupId ?? this.groupId,
    );
  }

  @override
  String toString() {
    return 'ItemUI(id: $id, name: $name, image: $image, unitDetails: $unitDetails, selectedUnit: $selectedUnit, clearPrice: $clearPrice, allQuantityOfItem: $allQuantityOfItem, indexOfUnitDetails: $indexOfUnitDetails, groupId: $groupId)';
  }

  @override
  bool operator ==(covariant ItemUI other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.image == image &&
        listEquals(other.unitDetails, unitDetails) &&
        other.selectedUnit == selectedUnit &&
        other.clearPrice == clearPrice &&
        other.allQuantityOfItem == allQuantityOfItem &&
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
        clearPrice.hashCode ^
        allQuantityOfItem.hashCode ^
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

  int? backQuantity;

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
  double preDiscount;

  UnitDetailsUI({
    this.backQuantity,
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
    required this.preDiscount,

    // required this.constantQuantity,
  });

  double get clearPrice => totalPrice + tax - discount;
}

class BillDetailsUI {
  final int id;
  final int itemId;
  final int unitId;
  final int billId;
  final String itemName;
  final String unitName;
  final BillDetailsEntity billDetailsEntity;

  BillDetailsUI({
    required this.id,
    required this.itemId,
    required this.unitId,
    required this.billId,
    required this.itemName,
    required this.unitName,
    required this.billDetailsEntity,
  });
}
