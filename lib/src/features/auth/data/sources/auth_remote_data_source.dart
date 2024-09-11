import 'package:era_pro_application/src/core/api/methods.dart';
import 'package:era_pro_application/src/core/constants/share_pref_keys.dart';
import 'package:era_pro_application/src/core/error/failures.dart';
import 'package:era_pro_application/src/core/services/shared_preferences.dart';
import 'package:era_pro_application/src/core/api/api.dart';
import 'package:era_pro_application/src/core/utils/encryptAndDecryptUtils.dart';
import 'package:era_pro_application/src/features/auth/data/models/auth_response_model.dart';

import '../../../../core/error/exception.dart';

abstract class AuthRemoteDatasource {
  Future<AuthResponseModel> auth({
    required String username,
    required String password,
  });
}

class AuthRemoteDatasourceImp implements AuthRemoteDatasource {
  final SharedPreferencesService sharedPreferencesService;

  final ApiConnection apiConnection;
  final HttpMethod httpMethod;

  AuthRemoteDatasourceImp({
    required this.sharedPreferencesService,
    required this.apiConnection,
    required this.httpMethod,
  });

  @override
  Future<AuthResponseModel> auth({
    required String username,
    required String password,
  }) async {
    final body = {
      "token": {
        "token": "",
        "refreshToken": "",
      },
      "user": {
        "username": EncrypterUtils.encrypt(plainText: username),
        "password": EncrypterUtils.encrypt(plainText: password),
      },
      "deviceInfo": {
        "deviceid": "209441",
        "devicename": "S23",
        "devicemodel": "ultra",
        "devicetype": "mobile",
        "userid": 5,
      },
    };

    try {
      final data = await httpMethod.post(body, apiConnection.authUrl);

      final authResponseModel = AuthResponseModel(
        refreshToken: data['token']['refreshToken'],
        token: data['token']['token'],
        userId: EncrypterUtils.decrypt(plainText: data['userid']),
      );

      await sharedPreferencesService.setString(
        SharedPrefKeys.TOKEN_KEY,
        authResponseModel.token,
      );
      await sharedPreferencesService.setString(
        SharedPrefKeys.REFRESHTOKEN_KEY,
        authResponseModel.refreshToken,
      );
      await sharedPreferencesService.setString(
        SharedPrefKeys.USERID_KEY,
        authResponseModel.userId,
      );

      return authResponseModel;
    } on ServerException {
      throw const ServerFailures(message: "Error from the server");
    } catch (e) {
      throw ServerFailures(message: "Error handling data: $e");
    }
  }
}
