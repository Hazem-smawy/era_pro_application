library dependency_injection;

import 'package:era_pro_application/src/core/api/api.dart';
import 'package:era_pro_application/src/core/api/methods.dart';
import 'package:era_pro_application/src/core/services/shared_preferences.dart';
import 'package:era_pro_application/src/features/accounts/data/implements/accounts_repository_imp.dart';
import 'package:era_pro_application/src/features/accounts/data/sources/accounts_local_datasource.dart';
import 'package:era_pro_application/src/features/accounts/data/sources/accounts_remote_datasource.dart';
import 'package:era_pro_application/src/features/accounts/domain/repositories/repositories.dart';
import 'package:era_pro_application/src/features/accounts/domain/usecases/usecases.dart';
import 'package:era_pro_application/src/features/accounts/presentation/getX/accounts_controller.dart';
import 'package:era_pro_application/src/features/auth/data/sources/auth_remote_data_source.dart';
import 'package:era_pro_application/src/features/auth/domain/usecases/usecases.dart';
import 'package:era_pro_application/src/features/auth/presentation/getX/auth_controller.dart';
import 'package:era_pro_application/src/features/main_info/data/implements/main_info_implements.dart';
import 'package:era_pro_application/src/features/main_info/data/sources/main_info_local_datasource.dart';
import 'package:era_pro_application/src/features/store/data/implements/store_implements.dart';
import 'package:era_pro_application/src/features/store/data/sources/store_local_datasource.dart';
import 'package:era_pro_application/src/features/store/data/sources/store_remote_datasource.dart';
import 'package:era_pro_application/src/features/store/domain/repositories/store_repositories.dart';
import 'package:era_pro_application/src/features/store/domain/usecases/get_all_item_details_usecase.dart';
import 'package:era_pro_application/src/features/store/domain/usecases/get_all_store_operation_usecase.dart';
import 'package:era_pro_application/src/features/store/domain/usecases/store_usecases.dart';
import 'package:era_pro_application/src/features/store/presentation/getX/store_controller.dart';
import 'package:era_pro_application/src/features/user/data/implements/user_implements.dart';
import 'package:era_pro_application/src/features/user/domain/repositories/user_repository.dart';
import 'package:era_pro_application/src/features/user/presentation/getX/user_controller.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/accounts/domain/usecases/add_account_usecase.dart';
import '../../features/auth/data/implements/auth_implements.dart';
import '../../features/auth/domain/repositories/repositories.dart';
import '../../features/main_info/data/sources/main_info_remote_datasource.dart';
import '../../features/main_info/domain/repositories/main_info_repository.dart';
import '../../features/main_info/presentation/getX/main_info_controller.dart';
import '../../features/user/data/sources/user_local_data_source.dart';
import '../../features/user/data/sources/user_remote_data_source.dart';
import '../../features/user/domain/usecases/usecases.dart';

import '../../features/main_info/domain/usecases/main_info_usecase.dart';

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
      () => AuthRepositoryImp(
        remoteDatasource: Get.find(),
      ),
      fenix: true,
    );

    //Datasources

    Get.lazyPut<AuthRemoteDatasource>(
      () => AuthRemoteDatasourceImp(
        httpMethod: Get.find(),
        apiConnection: Get.find(),
        sharedPreferencesService: Get.find(),
      ),
      fenix: true,
    );

//! Features - main-info
    //?controller
    Get.lazyPut(
      () => MainInfoController(
        getAllCurenciesUsecase: Get.find(),
        getBranchUsecase: Get.find(),
        getCompanyUsecase: Get.find(),
        getAllPaymentsUsecase: Get.find(),
        getAllSystemDocsUsecase: Get.find(),
      ),
      fenix: true,
    );

    //?usecase

    Get.lazyPut(
      () => GetAllPaymentsUsecase(
        mainInfoRepository: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => GetAllSystemDocsUsecase(
        mainInfoRepository: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut(
      () => GetBranchUsecase(
        mainInfoRepository: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => GetCompanyUsecase(
        mainInfoRepository: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => GetAllCurenciesUseCase(
        mainInfoRepository: Get.find(),
      ),
      fenix: true,
    );

    //?repository
    Get.lazyPut<MainInfoRepository>(
      () => MainInfoRepositoryImp(
        mainInfoLocalDatasource: Get.find(),
        mainInfoRemoteDatasource: Get.find(),
        sharedPreferencesService: Get.find(),
      ),
      fenix: true,
    );

    //?datasources
    Get.lazyPut<MainInfoLocalDatasource>(
      () => MainInfoLocalDatasourceImp(),
      fenix: true,
    );
    Get.lazyPut<MainInfoRemoteDatasource>(
      () => MainInfoRemoteDatasourceImp(
        apiConnection: Get.find(),
        httpMethod: Get.find(),
        sharedPreferencesService: Get.find(),
      ),
      fenix: true,
    );

//! Features - store
    //?controller
    Get.lazyPut(
      () => StoreController(
        getAllItemWithDetailsUsecase: Get.find(),
        getAllStoreOperationUsecase: Get.find(),
        getUserStoreInfoUsecase: Get.find(),
        getAllItemGroupsUsecase: Get.find(),
        getAllItemAlterUsecase: Get.find(),
        getAllItemBarcodeUsecase: Get.find(),
        getAllItemUnitsUsecase: Get.find(),
        getAllUnitsUsecase: Get.find(),
        getAllItemsUsecase: Get.find(),
      ),
      fenix: true,
    );

    //?usecase
    Get.lazyPut(
      () => GetAllItemWithDetailsUsecase(
        storeRepository: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => GetAllStoreOperationUsecase(
        storeRepository: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => GetUserStoreInfoUsecase(
        storeRepository: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => GetAllItemGroupsUsecase(
        storeRepository: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => GetAllItemUnitsUsecase(
        storeRepository: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => GetAllItemAlterUsecase(
        storeRepository: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => GetAllItemBarcodeUsecase(
        storeRepository: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut(
      () => GetAllUnitsUsecase(
        storeRepository: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut(
      () => GetAllItemsUsecase(
        storeRepository: Get.find(),
      ),
      fenix: true,
    );
    //?repository
    Get.lazyPut<StoreRepository>(
      () => StoreRepositoryImpl(
        storeLocalDatasource: Get.find(),
        storeRemoteDatasource: Get.find(),
        sharedPreferencesService: Get.find(),
      ),
      fenix: true,
    );

    //?datasources
    Get.lazyPut<StoreLocalDatasource>(
      () => StoreLocalDatasourceImpl(),
      fenix: true,
    );
    Get.lazyPut<StoreRemoteDatasource>(
      () => StoreRemoteDatasourceImp(
        apiConnection: Get.find(),
        httpMethod: Get.find(),
        sharedPreferencesService: Get.find(),
      ),
      fenix: true,
    );

    //! Features - user
    //?controller
    Get.lazyPut(
      () => UserController(
        getUserUseCase: Get.find(),
        getUserSettingsUsecase: Get.find(),
        sharedPreferencesService: Get.find(),
      ),
      fenix: true,
    );

    //?usecase
    Get.lazyPut(
      () => GetUserUseCase(
        userRepository: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut(
      () => GetUserSettingsUsecase(
        userRepository: Get.find(),
      ),
      fenix: true,
    );
    //?repostory
    Get.lazyPut<UserRepository>(
      () => UserRepositoryImp(
        sharedPreferencesService: Get.find(),
        userRemoteDataSource: Get.find(),
        userLocalDataSource: Get.find(),
      ),
      fenix: true,
    );
    //?datasource
    Get.lazyPut<UserLocalDataSource>(
      () => UserLocalDataSourceImp(),
      fenix: true,
    );
    Get.lazyPut<UserRemoteDataSource>(
      () => UserRemoteDataSourceImp(
          httpMethod: Get.find(),
          apiConnection: Get.find(),
          sharedPreferencesService: Get.find()),
      fenix: true,
    );

    //! Features - accounts
    //controller
    Get.lazyPut(
        () => AccountsController(
              getAccountsUseCase: Get.find(),
              addAccountUsecase: Get.find(),
            ),
        fenix: true);
    //Usecases
    Get.lazyPut(
      () => GetAccountsUseCase(accountsRepository: Get.find()),
      fenix: true,
    );
    Get.lazyPut(
      () => AddAccountUsecase(accountsRepository: Get.find()),
      fenix: true,
    );

    //Repository
    Get.lazyPut<AccountsRepository>(
      () => AccountsRepositoryImp(
        sharedPreferencesService: Get.find(),
        accountsLocalDatasource: Get.find(),
        accountsRemoteDatasource: Get.find(),
      ),
      fenix: true,
    );

    //Datasources

    Get.lazyPut<AccountsRemoteDatasource>(
      () => AccountsRemoteDatasourceImpl(
        httpMethod: Get.find(),
        apiConnection: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<AccountsLocalDatasource>(
      () => AccountsLocalDatasourceImpl(),
      fenix: true,
    );
  }
}
