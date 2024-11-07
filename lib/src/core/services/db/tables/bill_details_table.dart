import 'package:drift/drift.dart';
import 'package:era_pro_application/src/features/bills/data/models/bill_details_model.dart';

/*
  final int id;
  final int billID;
  final int itemId;
  final int itemUnitID;
  final int unitFactor;
  final int quantity;
  final int freeQty;
  final double avrageCost;
  final double sellPrice;
  final double totalSellPrice;
  final double discountPre;
  final double netSellPrice;
  final String expirDate;
  final int taxRate;
  final String itemNote;
  final double freeQtyCost;
*/
@UseRowClass(BillDetailsModel)
class BillDetailsTable extends Table {
  IntColumn get id => integer()();
  IntColumn get billID => integer()();
  IntColumn get itemId => integer()();
  IntColumn get itemUnitID => integer()();
  IntColumn get unitFactor => integer()();
  IntColumn get quantity => integer()();
  IntColumn get freeQty => integer()();
  RealColumn get avrageCost => real()();
  RealColumn get sellPrice => real()();
  RealColumn get totalSellPrice => real()();
  RealColumn get discountPre => real()();
  RealColumn get netSellPrice => real()();
  TextColumn get expirDate => text().nullable()();
  RealColumn get taxRate => real()();
  TextColumn get itemNote => text()();
  RealColumn get freeQtyCost => real()();

  @override
  Set<Column> get primaryKey => {id};
}
