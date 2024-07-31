import 'package:era_pro_applicationlication/src/features/user/data/implements/user_implements.dart';
import 'package:era_pro_applicationlication/src/features/user/data/sources/user_local_data_source.dart';
import 'package:era_pro_applicationlication/src/features/user/data/sources/user_remote_data_source.dart';
import 'package:era_pro_applicationlication/src/features/user/domain/repositories/repositories.dart';
import 'package:era_pro_applicationlication/src/features/user/domain/usecases/usecases.dart';
import 'package:get/get.dart';
import 'user_controller.dart';

class UserBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserLocalDataSource>(() => UserLocalDataSourceImp());
    Get.lazyPut<UserRemoteDataSource>(() => UserRemoteDataSourceImp());
    Get.lazyPut<UserRepository>(() => UserRepositoryImp(
        userRemoteDataSource: Get.find(), userLocalDataSource: Get.find()));
    Get.lazyPut(() => GetUserUseCase(userRepository: Get.find()));
    Get.lazyPut(() => UserController(getUserUseCase: Get.find()));
  }
}
