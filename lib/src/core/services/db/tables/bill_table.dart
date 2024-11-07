/*

required this.id,
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
      required this.paidAmount

*/

import 'package:drift/drift.dart';
import 'package:era_pro_application/src/features/bills/data/models/bill_model.dart';

@UseRowClass(BillModel)
class BillTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get branchId => integer()();
  IntColumn get billNumber => integer()();
  IntColumn get billType => integer()();
  DateTimeColumn get billDate => dateTime()();
  TextColumn get refNumber => text()();
  IntColumn get customerNumber => integer()();
  IntColumn get currencyId => integer()();
  RealColumn get currencyValue => real()();
  IntColumn get fundNumber => integer()();
  IntColumn get paymentMethed => integer()();
  IntColumn get storeId => integer()();
  RealColumn get storeCurValue => real()();
  TextColumn get billNote => text()();
  IntColumn get itemCalcMethod => integer()();
  DateTimeColumn get dueDate => dateTime()();
  IntColumn get salesPerson => integer()();
  BoolColumn get hasVat => boolean()();
  BoolColumn get hasSalesTax => boolean()();
  RealColumn get salesTaxRate => real()();
  IntColumn get numOfitems => integer()();
  RealColumn get totalBill => real()();
  RealColumn get itemsDiscount => real()();
  RealColumn get billDiscount => real()();
  RealColumn get netBill => real()();
  RealColumn get totalVat => real()();
  RealColumn get billFinalCost => real()();
  RealColumn get freeQtyCost => real()();
  RealColumn get totalAvragCost => real()();
  RealColumn get paidAmount => real()();

  ///Specifying which from the field above is the primary key
  @override
  Set<Column> get primaryKey => {id};
}
