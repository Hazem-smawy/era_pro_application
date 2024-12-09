// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:era_pro_application/src/core/api/api.dart';
import 'package:era_pro_application/src/features/user/data/models/user_model.dart';

import '../../../../core/api/methods.dart';
import '../../../../core/constants/share_pref_keys.dart';
import '../../../../core/services/shared_preferences.dart';
import '../../../main_info/data/models/main_info_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getUser();

  Future<UserSettingModel> getUserSettings();
}

class UserRemoteDataSourceImp implements UserRemoteDataSource {
  ApiConnection apiConnection;
  HttpMethod httpMethod;
  SharedPreferencesService sharedPreferencesService;
  UserRemoteDataSourceImp({
    required this.apiConnection,
    required this.httpMethod,
    required this.sharedPreferencesService,
  });

  @override
  Future<UserModel> getUser() async {
    return httpMethod.handleRequest(
      apiConnection.userUrl,
      (data) => UserModel.fromJson(data),
      SharedPrefKeys.DATETIME_USERINFO_KEY,
    );
  }

  @override
  Future<UserSettingModel> getUserSettings() {
    return httpMethod.handleRequest(
      apiConnection.userSettingsUrl,
      (data) => UserSettingModel.fromJson(data),
      SharedPrefKeys.DATETIME_USERSETTING_KEY,
    );
  }
}
