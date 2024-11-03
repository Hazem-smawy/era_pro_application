/*
{
    "id": 11,
    "branchId": 1,
    "billNumber": 8,
    "billType": 0,
    "billDate": "2023-12-23",
    "refNumber": "",
    "customerNumber": 36,
    "currencyId": 1,
    "currencyValue": 1,
    "fundNumber": 9,
    "paymentMethed": 0,
    "storeId": 1,
    "storeCurValue": 1,
    "billNote": "لا يوجد",
    "itemCalcMethod": 2,
    "dueDate": null,
    "salesPerson": 29,
    "hasVat": true,
    "hasSalesTax": true,
    "salesTaxRate": 5,
    "numOfitems": 1,
    "totalBill": 4800,
    "itemsDiscount": 96,
    "billDiscount": 0,
    "netBill": 4704,
    "totalVat": 240,
    "billFinalCost": 5179.2,
    "freeQtyCost": 0,
    "totalAvragCost": 3988.56,
    "paidAmount": 5179.2,
    "saleBillDetails": [
        {
            "id": 20014,
            "billID": 11,
            "itemId": 7,
            "itemUnitID": 1,
            "unitFactor": 24,
            "quantity": 1,
            "freeQty": 0,
            "avrageCost": 3988.56,
            "sellPrice": 4800,
            "totalSellPrice": 4800,
            "discountPre": 2,
            "netSellPrice": 4704,
            "expirDate": "2024-12",
            "taxRate": 5,
            "itemNote": null,
            "freeQtyCost": 0
        }
    ]
}




*/

import 'package:equatable/equatable.dart';

import '../../../../core/utils/date_time_converter.dart';

class BillEntity extends Equatable {
  int? id;
  final int branchId;
  final int billNumber;
  final int billType;
  @DateTimeConverter()
  final DateTime billDate;
  final String refNumber;
  final int customerNumber;
  final int currencyId;
  final double currencyValue;
  final int fundNumber;
  final int paymentMethed;
  final int storeId;
  final double storeCurValue;
  final String billNote;
  final int itemCalcMethod;
  @DateTimeConverter()
  final DateTime dueDate;
  final int salesPerson;
  final bool hasVat;
  final bool hasSalesTax;
  final int salesTaxRate;
  final int numOfitems;
  final double totalBill;
  final double itemsDiscount;
  final double billDiscount;
  final double netBill;
  final double totalVat;
  final double billFinalCost;
  final double freeQtyCost;
  final double totalAvragCost;
  final double paidAmount;

  BillEntity(
      {required this.id,
      required this.branchId,
      required this.billNumber,
      required this.billType,
      required this.billDate,
      required this.refNumber,
      required this.customerNumber,
      required this.currencyId,
      required this.currencyValue,
      required this.fundNumber,
      required this.paymentMethed,
      required this.storeId,
      required this.storeCurValue,
      required this.billNote,
      required this.itemCalcMethod,
      required this.dueDate,
      required this.salesPerson,
      required this.hasVat,
      required this.hasSalesTax,
      required this.salesTaxRate,
      required this.numOfitems,
      required this.totalBill,
      required this.itemsDiscount,
      required this.billDiscount,
      required this.netBill,
      required this.totalVat,
      required this.billFinalCost,
      required this.freeQtyCost,
      required this.totalAvragCost,
      required this.paidAmount});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        branchId,
        billNumber,
        billType,
        billDate,
        refNumber,
        customerNumber,
        currencyId,
        currencyValue,
        fundNumber,
        paymentMethed,
        storeId,
        storeCurValue,
        billNote,
        itemCalcMethod,
        dueDate,
        salesPerson,
        hasVat,
        hasSalesTax,
        salesTaxRate,
        numOfitems,
        totalBill,
        itemsDiscount,
        billDiscount,
        netBill,
        totalVat,
        billFinalCost,
        freeQtyCost,
        totalAvragCost,
        paidAmount,
      ];
}
