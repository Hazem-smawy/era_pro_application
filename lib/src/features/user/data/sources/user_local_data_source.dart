import 'package:era_pro_application/src/core/error/exception.dart';
import 'package:era_pro_application/src/features/user/data/models/user_model.dart';

import '../../../../core/services/db/db.dart';
import '../../../main_info/data/models/main_info_model.dart';

abstract class UserLocalDataSource {
  Future<int> saveUser(UserModel user);
  Future<UserModel?> getUser(int userId);

  Future<UserSettingModel?> getUserSettings(int id);
  Future<int> saveUserSettings(UserSettingModel userSettingModel);
}

class UserLocalDataSourceImp implements UserLocalDataSource {
  @override
  Future<int> saveUser(UserModel user) async {
    try {
      AppDatabase db = AppDatabase.instance();
      var id = await db.saveSingle(db.userTable, user.toCompanion());

      return id;
    } catch (e) {
      throw LocalStorageException(message: e.toString());
    }
  }

  @override
  Future<UserModel?> getUser(int userId) async {
    AppDatabase db = AppDatabase.instance();
    return await db.getSingle(db.userTable, (tbl) => tbl.id, userId);
  }

  @override
  Future<UserSettingModel?> getUserSettings(int id) async {
    AppDatabase db = AppDatabase.instance();
    return await db.getSingle(db.userSettingTable, (tbl) => tbl.id, id);
  }

  @override
  Future<int> saveUserSettings(UserSettingModel userSettingModel) async {
    AppDatabase db = AppDatabase.instance();
    var id = await db.saveSingle(
        db.userSettingTable, userSettingModel.toCompanion());
    return id;
  }
}
