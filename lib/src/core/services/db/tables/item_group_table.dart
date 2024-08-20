/*
 "id": 1,
        "code": 1,
        "name": "العصائر",
        "type": 0,
        "parent": 0,
        "note": "",
        "newData": true
 */

import 'package:drift/drift.dart';
import 'package:era_pro_application/src/features/main_info/data/models/item_group_model.dart';

@UseRowClass(ItemGroupModel)
class ItemGroupTable extends Table {
  IntColumn get id => integer()();
  IntColumn get code => integer()();
  IntColumn get type => integer()();
  IntColumn get parent => integer()();

  TextColumn get name => text()();

  TextColumn get note => text()();
  BoolColumn get newData => boolean()();

  ///Specifying which from the field above is the primary key
  @override
  Set<Column> get primaryKey => {id};
}
