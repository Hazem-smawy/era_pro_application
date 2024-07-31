// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import 'package:era_pro_applicationlication/src/core/api/api.dart';
import 'package:era_pro_applicationlication/src/core/api/methods.dart';
import 'package:era_pro_applicationlication/src/core/error/failures.dart';
import 'package:era_pro_applicationlication/src/features/user/data/models/user_model.dart';

import '../../../../core/services/shared_pref.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getUser();
}

class UserRemoteDataSourceImp implements UserRemoteDataSource {
  ApiConnection apiConnection = Get.find();
  HttpMethod httpMethod = Get.find();
  final SharedPreferencesService _sharedPreferencesService = Get.find();

  @override
  Future<UserModel> getUser() async {
    Map<String, dynamic> body = {
      "userid": _sharedPreferencesService.getString('userId'),
      "branchid": null,
      "dateTime": null
    };
    try {
      final data = await httpMethod.post(body, apiConnection.userUrl);

      return UserModel.fromJson(data);
    } catch (e) {
      throw Left(ServerFailures(message: "server fuilrs : $e"));
    }
  }
}
