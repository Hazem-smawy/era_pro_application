import 'package:era_pro_application/src/core/api/methods.dart';
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

  AuthRemoteDatasourceImp(
      {required this.sharedPreferencesService,
      required this.apiConnection,
      required this.httpMethod});

  @override
  Future<AuthResponseModel> auth(
      {required String username, required String password}) async {
    final body = {
      "token": {"token": "", "refreshToken": ""},
      "user": {
        "username": EncrypterUtils.encrypt(plainText: 'hazem'),
        "password": EncrypterUtils.encrypt(plainText: '123'),
      },
      "deviceInfo": {
        "deviceid": "209441",
        "devicename": "S23",
        "devicemodel": "ultra",
        "devicetype": "mobile",
        "userid": 5
      }
    };
    try {
      final data = await httpMethod.post(body, apiConnection.authUrl);
      final authResponseModel = AuthResponseModel(
        refreshToken: data['token']['refreshToken'],
        token: data['token']['token'],
        userId: EncrypterUtils.decrypt(plainText: data['userid']),
      );
      await sharedPreferencesService.setString(
          'token', authResponseModel.token);
      await sharedPreferencesService.setString(
          'refreshToken', authResponseModel.refreshToken);
      await sharedPreferencesService.setString(
        'userId',
        authResponseModel.userId,
      );

      return authResponseModel;
    } on ServerException {
      throw const ServerFailures(message: "error from the servier");
    } catch (e) {
      throw const ServerFailures(message: "error handling data");
    }
  }
}
