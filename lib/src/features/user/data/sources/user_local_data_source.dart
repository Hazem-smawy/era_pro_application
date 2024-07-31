import 'package:era_pro_applicationlication/src/features/user/data/models/user_model.dart';

import '../../../../core/services/db/db.dart';

abstract class UserLocalDataSource {
  Future<int> saveUser(UserModel user);
  Future<UserModel?> getUser(int userId);
}

class UserLocalDataSourceImp implements UserLocalDataSource {
  @override
  Future<int> saveUser(UserModel user) async {
    try {
      AppDatabase db = AppDatabase.instance();
      await db.into(db.userTable).insertOnConflictUpdate(user.toCompanion());
      return user.id ?? 0;
    } catch (e) {
      throw Exception("local data error");
    }
  }

  @override
  Future<UserModel?> getUser(int userId) async {
    AppDatabase db = AppDatabase.instance();
    UserModel? user = await (db.select(db.userTable)
          ..where((tbl) => tbl.id.equals(userId)))
        .getSingleOrNull();
    return user;
  }
}
