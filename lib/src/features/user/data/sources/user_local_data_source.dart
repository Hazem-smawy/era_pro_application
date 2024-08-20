import 'package:era_pro_application/src/core/error/exception.dart';
import 'package:era_pro_application/src/features/user/data/models/user_model.dart';

import '../../../../core/services/db/db.dart';

abstract class UserLocalDataSource {
  Future<void> saveUser(UserModel user);
  Future<UserModel?> getUser(int userId);
}

class UserLocalDataSourceImp implements UserLocalDataSource {
  @override
  Future<void> saveUser(UserModel user) async {
    try {
      AppDatabase db = AppDatabase.instance();
      await db.saveSingle(db.userTable, user.toCompanion());
    } catch (e) {
      throw LocalStorageException(message: e.toString());
    }
  }

  @override
  Future<UserModel?> getUser(int userId) async {
    AppDatabase db = AppDatabase.instance();
    /*
    // UserModel? user = await (db.select(db.userTable)
    //       ..where((tbl) => tbl.id.equals(userId)))
    //     .getSingleOrNull();
    */
    try {
      final user = await db.getSingle(db.userTable, (tbl) => tbl.id, userId);

      return user;
    } catch (e) {
      throw LocalStorageException(message: e.toString());
    }
  }
}
