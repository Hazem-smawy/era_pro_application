import 'package:drift/drift.dart';
import 'package:era_pro_applicationlication/src/features/user/data/models/user_model.dart';

@UseRowClass(UserModel)
class UserTable extends Table {
  IntColumn get id => integer()();

  TextColumn get userName => text()();

  TextColumn get password => text()();
  IntColumn get userAcctype => integer()();
  IntColumn get branchId => integer()();
  IntColumn get groupId => integer()();

  TextColumn get note => text()();

  ///Specifying which from the field above is the primary key
  @override
  Set<Column> get primaryKey => {id};
}
