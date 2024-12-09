import 'package:drift/drift.dart';
import 'package:era_pro_application/src/core/services/db/db.dart';
import 'package:era_pro_application/src/features/bills/domain/entities/bill_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/utils/date_time_converter.dart';

part 'bill_model.g.dart';

@JsonSerializable()
class BillModel extends BillEntity {
  BillModel(
      {required super.id,
      required super.branchId,
      required super.billNumber,
      required super.billType,
      required super.billDate,
      required super.refNumber,
      required super.customerNumber,
      required super.currencyId,
      required super.currencyValue,
      required super.fundNumber,
      required super.paymentMethed,
      required super.storeId,
      required super.storeCurValue,
      required super.billNote,
      required super.itemCalcMethod,
      required super.dueDate,
      required super.salesPerson,
      required super.hasVat,
      required super.hasSalesTax,
      required super.salesTaxRate,
      required super.numOfitems,
      required super.totalBill,
      required super.itemsDiscount,
      required super.billDiscount,
      required super.netBill,
      required super.totalVat,
      required super.billFinalCost,
      required super.freeQtyCost,
      required super.totalAvragCost,
      required super.paidAmount});

  factory BillModel.fromJson(Map<String, dynamic> json) =>
      _$BillModelFromJson(json);

  Map<String, dynamic> toJson() => _$BillModelToJson(this);

  BillTableCompanion toCompanion() {
    return BillTableCompanion(
      id: id == -1 ? const Value.absent() : Value(id),
      branchId: Value(branchId),
      billNumber: Value(billNumber),
      billType: Value(billType),
      billDate: Value(billDate),
      refNumber: Value(refNumber),
      customerNumber: Value(customerNumber),
      currencyId: Value(currencyId),
      currencyValue: Value(currencyValue),
      fundNumber: Value(fundNumber),
      paymentMethed: Value(paymentMethed),
      storeId: Value(storeId),
      storeCurValue: Value(storeCurValue),
      billNote: Value(billNote),
      itemCalcMethod: Value(itemCalcMethod),
      dueDate: Value(dueDate),
      salesPerson: Value(salesPerson),
      hasVat: Value(hasVat),
      hasSalesTax: Value(hasSalesTax),
      salesTaxRate: Value(salesTaxRate),
      numOfitems: Value(numOfitems),
      totalBill: Value(totalBill),
      itemsDiscount: Value(itemsDiscount),
      billDiscount: Value(billDiscount),
      netBill: Value(netBill),
      totalVat: Value(totalVat),
      billFinalCost: Value(billFinalCost),
      freeQtyCost: Value(freeQtyCost),
      totalAvragCost: Value(totalAvragCost),
      paidAmount: Value(paidAmount),
    );
  }

  factory BillModel.fromEntity(BillEntity entity) {
    return BillModel(
        id: entity.id,
        branchId: entity.branchId,
        billNumber: entity.billNumber,
        billType: entity.billType,
        billDate: entity.billDate,
        refNumber: entity.refNumber,
        customerNumber: entity.customerNumber,
        currencyId: entity.currencyId,
        currencyValue: entity.currencyValue,
        fundNumber: entity.fundNumber,
        paymentMethed: entity.paymentMethed,
        storeId: entity.storeId,
        storeCurValue: entity.storeCurValue,
        billNote: entity.billNote,
        itemCalcMethod: entity.itemCalcMethod,
        dueDate: entity.dueDate,
        salesPerson: entity.salesPerson,
        hasVat: entity.hasVat,
        hasSalesTax: entity.hasSalesTax,
        salesTaxRate: entity.salesTaxRate,
        numOfitems: entity.numOfitems,
        totalBill: entity.totalBill,
        itemsDiscount: entity.itemsDiscount,
        billDiscount: entity.billDiscount,
        netBill: entity.netBill,
        totalVat: entity.totalVat,
        billFinalCost: entity.billFinalCost,
        freeQtyCost: entity.freeQtyCost,
        totalAvragCost: entity.totalAvragCost,
        paidAmount: entity.paidAmount);
  }
}
