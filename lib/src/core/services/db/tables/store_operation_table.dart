/*
 required super.id,
    required super.operationId,
    required super.operationType,
    required super.operationDate,
    required super.operationIn,
    required super.storeId,
    required super.itemId,
    required super.unitId,
    required super.quantity,
    required super.averageCost,
    required super.unitCost,
    required super.totalCost,
    required super.unitFactor,
    required super.qtyConvert,
    required super.expirDate,
    required super.addBranch,
*/

import 'package:drift/drift.dart';
import 'package:era_pro_application/src/core/services/db/tables/db_tables.dart';

import '../../../../features/store/data/models/models.dart';

@UseRowClass(StoreOperationModel)
class StoreOperationTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get operationId => integer()();
  IntColumn get operationType => integer()();
  DateTimeColumn get operationDate => dateTime()();
  BoolColumn get operationIn => boolean()();
  IntColumn get storeId => integer()();
  IntColumn get itemId => integer().references(ItemTable, #id)();
  IntColumn get unitId => integer().references(UnitTable, #id)();
  IntColumn get quantity => integer()();
  RealColumn get averageCost => real()();
  RealColumn get unitCost => real()();
  RealColumn get totalCost => real()();
  IntColumn get unitFactor => integer()();
  IntColumn get qtyConvert => integer()();
  TextColumn get expirDate => text()();
  IntColumn get addBranch => integer()();

  // @override
  // Set<Column> get primaryKey => {id};
}
