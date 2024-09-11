/*
  required super.custParent,
    required super.generateCode,
    required super.custGroup,
*/

import 'package:drift/drift.dart';
import 'package:era_pro_application/src/features/user/data/models/user_setting_model.dart';

@UseRowClass(UserSettingModel)
class UserSettingTable extends Table {
  IntColumn get id => integer()();
  IntColumn get custParent => integer()();
  IntColumn get custGroup => integer()();
  TextColumn get generateCode => text()();

  @override
  Set<Column> get primaryKey => {id};
}
