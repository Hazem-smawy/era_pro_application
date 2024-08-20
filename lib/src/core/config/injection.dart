library dependency_injection;

import 'package:era_pro_application/src/core/api/api.dart';
import 'package:era_pro_application/src/core/api/methods.dart';
import 'package:era_pro_application/src/core/services/shared_preferences.dart';
import 'package:era_pro_application/src/features/auth/data/sources/auth_remote_data_source.dart';
import 'package:era_pro_application/src/features/auth/domain/usecases/usecases.dart';
import 'package:era_pro_application/src/features/auth/presentation/getX/auth_controller.dart';
import 'package:era_pro_application/src/features/main_info/data/implements/main_info_implements.dart';
import 'package:era_pro_application/src/features/main_info/data/sources/main_info_local_datasource.dart';
import 'package:era_pro_application/src/features/main_info/domain/usecases/get_all_curencies.dart';
import 'package:era_pro_application/src/features/main_info/domain/usecases/get_all_units_usecase.dart';
import 'package:era_pro_application/src/features/main_info/domain/usecases/get_branch_usecase.dart';
import 'package:era_pro_application/src/features/user/data/implements/user_implements.dart';
import 'package:era_pro_application/src/features/user/domain/repositories/repositories.dart';
import 'package:era_pro_application/src/features/user/presentation/getX/user_controller.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/implements/auth_implements.dart';
import '../../features/auth/domain/repositories/repositories.dart';
import '../../features/main_info/data/sources/main_info_remote_datasource.dart';
import '../../features/main_info/domain/repositories/main_info_repository.dart';
import '../../features/main_info/domain/usecases/get_company_usecase.dart';
import '../../features/main_info/presentation/getX/main_info_controller.dart';
import '../../features/user/data/sources/user_local_data_source.dart';
import '../../features/user/data/sources/user_remote_data_source.dart';
import '../../features/user/domain/usecases/usecases.dart';

class DependencyInjection {
  static Future<void> init() async {
    //? core

    //shared prefrences
    final sharedPreferences = await SharedPreferences.getInstance();
    Get.lazyPut(() => sharedPreferences, fenix: true);
    Get.lazyPut(() => SharedPreferencesService(Get.find()), fenix: true);
    //http
    final client = http.Client();
    Get.lazyPut(() => HttpMethod(client: client), fenix: true);
    Get.lazyPut(() => ApiConnection(), fenix: true);
    Get.lazyPut(() => http.Client(), fenix: true);

    //! Features - auth
    //controller
    Get.lazyPut(() => AuthController(authUseCase: Get.find()), fenix: true);
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
            httpMethod: Get.find(),
            apiConnection: Get.find(),
            sharedPreferencesService: Get.find()),
        fenix: true);

//! Features - main-info
    //controller
    Get.lazyPut(
      () => MainInfoController(
          getAllCurencies: Get.find(),
          getBranchUsecase: Get.find(),
          getCompanyUsecase: Get.find(),
          getAllUnitsUsecase: Get.find()),
      fenix: true,
    );

    //usecase
    Get.lazyPut(() => GetAllUnitsUsecase(mainInfoRepository: Get.find()),
        fenix: true);
    Get.lazyPut(() => GetBranchUsecase(mainInfoRepository: Get.find()),
        fenix: true);
    Get.lazyPut(() => GetCompanyUsecase(mainInfoRepository: Get.find()),
        fenix: true);
    Get.lazyPut(() => GetAllCurenciesUseCase(mainInfoRepository: Get.find()),
        fenix: true);
    //repository
    Get.lazyPut<MainInfoRepository>(
        () => MainInfoRepositoryImp(
            mainInfoLocalDatasource: Get.find(),
            mainInfoRemoteDatasource: Get.find(),
            sharedPreferencesService: Get.find()),
        fenix: true);

    //datasources
    Get.lazyPut<MainInfoLocalDatasource>(() => MainInfoLocalDatasourceImp(),
        fenix: true);
    Get.lazyPut<MainInfoRemoteDatasource>(
        () => MainInfoRemoteDatasourceImp(
            apiConnection: Get.find(),
            httpMethod: Get.find(),
            sharedPreferencesService: Get.find()),
        fenix: true);

    //! Features - user
    //controller
    Get.lazyPut(() => UserController(getUserUseCase: Get.find()), fenix: true);

    //usecase
    Get.lazyPut(() => GetUserUseCase(userRepository: Get.find()), fenix: true);
    //repostory
    Get.lazyPut<UserRepository>(
        () => UserRepositoryImp(
            userRemoteDataSource: Get.find(), userLocalDataSource: Get.find()),
        fenix: true);
    //datasource
    Get.lazyPut<UserLocalDataSource>(() => UserLocalDataSourceImp(),
        fenix: true);
    Get.lazyPut<UserRemoteDataSource>(
        () => UserRemoteDataSourceImp(
            httpMethod: Get.find(),
            apiConnection: Get.find(),
            sharedPreferencesService: Get.find()),
        fenix: true);
  }
}
