/*

        "id": 11,
        "accTag": 1,
        "accName": "حساب المخزون",
        "accNumber": 122010002
*/
import 'package:drift/drift.dart';
import 'package:era_pro_application/src/features/accounts/data/models/ref_account_model.dart';

@UseRowClass(RefAccountModel)
class RefAccountTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get accTag => integer()();
  TextColumn get accName => text()();
  IntColumn get accNumber => integer()();
}
