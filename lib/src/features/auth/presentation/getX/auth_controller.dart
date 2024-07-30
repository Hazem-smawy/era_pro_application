// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:era_pro_applicationlication/src/core/routes/routes.dart';
import 'package:era_pro_applicationlication/src/core/types/status_types.dart';
import 'package:era_pro_applicationlication/src/features/auth/domain/usecases/usecases.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final authState = RequestStatus.LOADING.obs;
  final username = "".obs;
  final password = "".obs;

  void setRxRequestStatus(RequestStatus value) => authState.value = value;

  AuthUseCase authUseCase;

  AuthController({
    required this.authUseCase,
  });

  void auth() async {
    var result =
        await authUseCase(username: username.value, password: password.value);
    result.fold((l) {
      print(l.message);
      setRxRequestStatus(RequestStatus.ERROR);
    }, (r) {
      setRxRequestStatus(RequestStatus.SUCESS);
      Get.toNamed(AppRouteName.home.name);
    });
  }
}
