// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:era_pro_applicationlication/src/core/api/api.dart';
import 'package:era_pro_applicationlication/src/core/routes/routes.dart';
import 'package:era_pro_applicationlication/src/core/types/status_types.dart';
import 'package:era_pro_applicationlication/src/features/auth/domain/usecases/usecases.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ipController = TextEditingController();
  TextEditingController portController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  ApiConnection apiConnection = Get.find();
  final authState = RequestStatus.LOADING.obs;

  void setRxRequestStatus(RequestStatus value) => authState.value = value;

  AuthUseCase authUseCase;

  AuthController({
    required this.authUseCase,
  });

  void auth() async {
    if (formKey.currentState!.validate()) {
      apiConnection.setIp = ipController.text.trim();
      apiConnection.setPort = portController.text.trim();
      var result = await authUseCase(
        username: nameController.text.trim(),
        password: passwordController.text.trim(),
      );
      result.fold((l) {
        print(l.message);
      }, (r) {
        Get.toNamed(AppRouteName.home.name);
        print('success');
      });
    }
  }
}
