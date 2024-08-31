/*
  required super.id,
    required super.itemId,
    required super.itemAlterId,
    required super.itemOrder,

    */

import 'package:drift/drift.dart';
import 'package:era_pro_application/src/features/main_info/data/models/item_alter_model.dart';

@UseRowClass(ItemAlterModel)
class ItemAlterTable extends Table {
  IntColumn get id => integer()();
  IntColumn get itemId => integer()();
  IntColumn get itemAlterId => integer()();
  IntColumn get itemOrder => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
