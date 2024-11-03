import 'dart:typed_data';

class BillUI {
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
  BillUI({
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

class ItemUI {
  int id;
  String name;
  // int quantity;
  Uint8List? image;

  List<UnitDetailsUI> unitDetails;

  String note;
  UnitDetailsUI selectedUnit;
  UnitDetailsUI smallUnit;
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

  ItemUI({
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

class UnitDetailsUI {
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

  UnitDetailsUI({
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
