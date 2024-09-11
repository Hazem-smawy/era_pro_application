import 'package:drift/drift.dart';
import 'package:era_pro_application/src/features/store/data/models/user_store_model.dart';

/*
{
    "id": 4,
    "name": "مخزن حازم",
    "accountNumber": 10204010002,
    "branchId": 1,
    "storeManager": "حازم عبد العزيز السماوي",
    "managerPhone": "790570725",
    "note": "لا يوجد"
}
 */
@UseRowClass(UserStoreModel)
class UserStoreTable extends Table {
  IntColumn get id => integer()();

  TextColumn get name => text()();
  IntColumn get accountNumber => integer()();
  IntColumn get branchId => integer()();
  TextColumn get storeManager => text()();
  TextColumn get managerPhone => text()();

  TextColumn get note => text()();

  ///Specifying which from the field above is the primary key
  @override
  Set<Column> get primaryKey => {id};
}
