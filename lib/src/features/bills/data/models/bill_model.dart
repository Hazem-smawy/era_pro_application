import 'package:drift/drift.dart';
import 'package:era_pro_application/src/core/services/db/db.dart';
import 'package:era_pro_application/src/features/bills/domain/entities/bill_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/utils/date_time_converter.dart';

part 'bill_model.g.dart';

@JsonSerializable()
class BillsModel extends BillEntity {
  BillsModel(
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

  factory BillsModel.fromJson(Map<String, dynamic> json) =>
      _$BillsModelFromJson(json);

  Map<String, dynamic> toJson() => _$BillsModelToJson(this);
  //   BranchTableCompanion toCompanion() {
  //   return BranchTableCompanion(
  //     id: Value(id),
  //     companyId: Value(companyId),
  //     name: Value(name),
  //     address: Value(address ?? ''),
  //     email: Value(email ?? ''),
  //     phone: Value(phone ?? ''),
  //     enReportHeader: Value(enReportHeader ?? ''),
  //     arReportHeader: Value(arReportHeader ?? ''),
  //     note: Value(note ?? ''),
  //     logo: Value(logo ?? Uint8List(0)),
  //   );
  // }

  BillTableCompanion toCompanion() {
    return BillTableCompanion(
      id: Value(id ?? -1),
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
}
