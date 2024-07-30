library dependency_injection;

import 'package:era_pro_applicationlication/src/core/api/api.dart';
import 'package:era_pro_applicationlication/src/features/auth/data/sources/auth_remoteDatasource.dart';
import 'package:era_pro_applicationlication/src/features/auth/domain/usecases/usecases.dart';
import 'package:era_pro_applicationlication/src/features/auth/presentation/getX/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/implements/auth_reposatory.dart';
import '../../features/auth/domain/repositories/repositories.dart';

class DependencyInjection {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    //? core
    Get.lazyPut(() => ApiConnection(), fenix: true);
    Get.lazyPut(() => http.Client(), fenix: true);

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Get.lazyPut(() => sharedPreferences, fenix: true);

    //! Features - posts
    //Usecases
    Get.lazyPut(() => AuthUseCase(repository: Get.find()), fenix: true);

    //Repository
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImp(remoteDatasource: Get.find()),
      fenix: true,
    );

    //Datasources

    Get.lazyPut<AuthRemoteDatasource>(
        () => AuthRemoteDatasourceImp(
            sharedPreferences: Get.find(), client: Get.find()),
        fenix: true);

    //controller
    Get.lazyPut(() => AuthController(authUseCase: Get.find()), fenix: true);
  }
}
