import 'dart:async';

import 'package:era_pro_application/src/core/constants/share_pref_keys.dart';
import 'package:era_pro_application/src/core/error/failures.dart';
import 'package:era_pro_application/src/core/services/shared_preferences.dart';
import 'package:era_pro_application/src/core/api/api.dart';
import 'package:era_pro_application/src/core/utils/encryptAndDecryptUtils.dart';
import 'package:era_pro_application/src/features/auth/data/models/auth_response_model.dart';
import 'package:era_pro_application/src/core/error/exception.dart';

import '../../../../core/api/methods.dart';
import '../../../../core/utils/device_info.dart';

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
    try {
      // Retrieve tokens and user ID from shared preferences
      final token =
          sharedPreferencesService.getString(SharedPrefKeys.TOKEN_KEY) ?? '';
      final refreshToken =
          sharedPreferencesService.getString(SharedPrefKeys.REFRESHTOKEN_KEY) ??
              '';
      final userId =
          sharedPreferencesService.getString(SharedPrefKeys.USERID_KEY) ?? '0';

      // Retrieve device information
      final deviceInfo = await DeviceInfo.initPlatformState();

      // Construct the request body
      final body = {
        "token": {
          "token": token,
          "refreshToken": refreshToken,
        },
        "user": {
          "username":
              userId != '0' ? '' : EncrypterUtils.encrypt(plainText: username),
          "password":
              userId != '0' ? '' : EncrypterUtils.encrypt(plainText: password),
        },
        "deviceInfo": {
          "deviceid": deviceInfo['device_id'] ?? '',
          "devicename": deviceInfo['device_name'] ?? '',
          "devicemodel": deviceInfo['Model'] ?? '',
          "devicetype": deviceInfo['os'] ?? '',
          "userid": int.tryParse(userId),
        },
      };

      // Send the request and process the response
      final data = await httpMethod.post(body, apiConnection.authUrl);

      final tokenResponse = data['token'] as Map<String, dynamic>?;
      if (tokenResponse == null) {
        throw const ServerFailures(
            message: 'Invalid response structure: tokenResponse is null');
      }

      final tokenValue = tokenResponse['token'] as String?;
      final refreshTokenValue = tokenResponse['refreshToken'] as String?;
      final userIdValue = data['userid'] as String?;

      if (tokenValue == null ||
          refreshTokenValue == null ||
          userIdValue == null) {
        throw const ServerFailures(
            message: 'Missing required fields in response');
      }

      final authResponseModel = AuthResponseModel(
        refreshToken: refreshTokenValue,
        token: tokenValue,
        userId: EncrypterUtils.decrypt(plainText: userIdValue),
      );

      // Save tokens and user ID to shared preferences
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
