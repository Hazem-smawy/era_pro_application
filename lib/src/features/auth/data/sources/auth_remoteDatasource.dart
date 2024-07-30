import 'package:era_pro_applicationlication/src/core/api/methods.dart';
import 'package:era_pro_applicationlication/src/core/error/failures.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:era_pro_applicationlication/src/core/api/api.dart';
import 'package:era_pro_applicationlication/src/core/utils/encryptAndDecryptUtils.dart';
import 'package:era_pro_applicationlication/src/features/auth/data/models/auth_response_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exception.dart';

abstract class AuthRemoteDatasource {
  Future<AuthResponseModel> auth(
      {required String username, required String password});
}

class AuthRemoteDatasourceImp implements AuthRemoteDatasource {
  final http.Client client;
  final SharedPreferences sharedPreferences;

  final ApiConnection apiConnection = Get.find();

  AuthRemoteDatasourceImp(
      {required this.sharedPreferences, required this.client});

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
      final data = await HttpMethod.post(body, apiConnection.authUrl);

      final authResponseModel = AuthResponseModel(
        refreshToken: data['token']['refreshToken'],
        token: data['token']['token'],
        userId: EncrypterUtils.decrypt(plainText: data['userid']),
      );
      await sharedPreferences.setString('token', authResponseModel.token);
      await sharedPreferences.setString(
          'refreshToken', authResponseModel.refreshToken);
      await sharedPreferences.setString('userId', authResponseModel.userId);

      return authResponseModel;
    } on ServerExeption {
      throw const ServerFailures(message: "error from the servier");
    } catch (e) {
      throw const ServerFailures(message: "error handling data");
    }
  }
}
