/*

   "id": 1,
        "accTag": 1,
        "accName": "حساب الشيكات الصادره",
        "accNumber": 224030001,
        "branchId": 0
*/
import 'package:drift/drift.dart';
import 'package:era_pro_application/src/features/accounts/data/models/mid_account_model.dart';

@UseRowClass(MidAccountModel)
class MidAccountTable extends Table {
  IntColumn get id => integer()();
  IntColumn get accTag => integer()();
  TextColumn get accName => text()();
  IntColumn get accNumber => integer()();
  IntColumn get branchId => integer()();

  // @override
  // Set<Column> get primaryKey => {id};

  @override
  Set<Column> get primaryKey => {id};
}
