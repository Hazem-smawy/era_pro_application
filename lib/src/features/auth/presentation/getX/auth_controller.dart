// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/core/api/api.dart';
import 'package:era_pro_application/src/core/routes/routes.dart';
import 'package:era_pro_application/src/core/types/status_types.dart';
import 'package:era_pro_application/src/features/auth/domain/usecases/usecases.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ipController = TextEditingController();
  TextEditingController portController = TextEditingController();
  final errorMessage = ''.obs;
  final formKey = GlobalKey<FormState>();
  ApiConnection apiConnection = Get.find();
  final authState = Status.NOTHING.obs;

  AuthUseCase authUseCase;

  AuthController({
    required this.authUseCase,
  });

  void auth() async {
    errorMessage.value = '';
    if (formKey.currentState!.validate()) {
      authState.value = Status.LOADING;
      apiConnection.setIp = ipController.text.trim();
      apiConnection.setPort = portController.text.trim();
      var result = await authUseCase(
          Tuple2(nameController.text.trim(), passwordController.text.trim()));
      result.fold((l) {
        errorMessage.value = l.message;
        authState.value = Status.ERROR;
      }, (r) {
        Get.offAllNamed(AppRouteName.bnp.name);
        authState.value = Status.SUCCESS;
      });
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    nameController.dispose();
    ipController.dispose();
    portController.dispose();
    passwordController.dispose();
  }
}
