// import 'package:era_pro_application/src/features/main_info/data/implements/main_info_implements.dart';
// import 'package:era_pro_application/src/features/main_info/data/sources/main_info_local_datasource.dart';
// import 'package:era_pro_application/src/features/main_info/data/sources/main_info_remote_datasource.dart';
// import 'package:era_pro_application/src/features/main_info/domain/repositories/main_info_repository.dart';
// import 'package:era_pro_application/src/features/main_info/domain/usecases/get_branch_usecase.dart';
// import 'package:era_pro_application/src/features/main_info/domain/usecases/get_company_usecase.dart';
// import 'package:get/get.dart';
// import 'main_info_controller.dart';

// // class MainInfoBinding implements Bindings {
// //   @override
// //   void dependencies() {
// //     Get.lazyPut<MainInfoLocalDatasource>(() => MainInfoLocalDatasourceImp());
// //     Get.lazyPut<MainInfoRemoteDatasource>(() => MainInfoRemoteDatasourceImp(
// //         apiConnection: Get.find(),
// //         httpMethod: Get.find(),
// //         sharedPreferencesService: Get.find()));
// //     Get.lazyPut<MainInfoRepository>(
// //       () => MainInfoRepositoryImp(
// //           mainInfoLocalDatasource: Get.find(),
// //           mainInfoRemoteDatasource: Get.find(),
// //           sharedPreferencesService: Get.find()),
// //     );
// //     Get.lazyPut(() => GetBranchUsecase(mainInfoRepository: Get.find()));
// //     Get.lazyPut(() => GetCompanyUsecase(mainInfoRepository: Get.find()));
// //     Get.lazyPut(() => MainInfoController(
// //         getBranchUsecase: Get.find(), getCompanyUsecase: Get.find()));
// //   }
// // }
