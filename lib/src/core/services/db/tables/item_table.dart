/*
  required super.id,
    required super.itemGroupId,
    required super.itemCode,
    required super.name,
    required super.enName,
    required super.type,
    required super.itemLimit,
    required super.itemImage,
    required super.isExpire,
    required super.notifyBefore,
    required super.freeQuantityAllow,
    required super.hasTax,
    required super.taxRate,
    required super.itemCompany,
    required super.orignalCountry,
    required super.itemDescription,
    required super.note,
    required super.hasAlternated,
    required super.newData,

 */

import 'package:drift/drift.dart';
import 'package:era_pro_application/src/core/services/db/tables/db_tables.dart';
import 'package:era_pro_application/src/features/store/data/models/item_model.dart';

@UseRowClass(ItemModel)
class ItemTable extends Table {
  IntColumn get id => integer()();
  IntColumn get itemGroupId => integer().references(ItemGroupTable, #id)();
  IntColumn get itemCode => integer()();
  TextColumn get name => text()();
  TextColumn get enName => text()();
  IntColumn get type => integer()();
  IntColumn get itemLimit => integer()();
  BlobColumn get itemImage => blob().nullable()();
  BoolColumn get isExpire => boolean()();
  BoolColumn get freeQuantityAllow => boolean()();
  BoolColumn get hasTax => boolean()();
  BoolColumn get hasAlternated => boolean()();
  BoolColumn get newData => boolean()();

  IntColumn get notifyBefore => integer()();
  IntColumn get taxRate => integer()();
  TextColumn get itemCompany => text()();
  TextColumn get orignalCountry => text()();
  TextColumn get itemDescription => text()();
  TextColumn get note => text()();

  ///Specifying which from the field above is the primary key
  @override
  Set<Column> get primaryKey => {id};
}
