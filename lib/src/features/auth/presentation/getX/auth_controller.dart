// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/core/api/api.dart';
import 'package:era_pro_application/src/core/types/status_types.dart';
import 'package:era_pro_application/src/features/accounts/presentation/getX/accounts_controller.dart';
import 'package:era_pro_application/src/features/auth/domain/usecases/usecases.dart';
import 'package:era_pro_application/src/features/main_info/presentation/getX/main_info_controller.dart';
import 'package:era_pro_application/src/features/store/presentation/getX/store_controller.dart';
import 'package:era_pro_application/src/features/user/presentation/getX/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/routes/app_pages.dart';

class AuthController extends GetxController {
  //controllers
  MainInfoController mainInfoController = Get.find();
  StoreController storeController = Get.find();
  AccountsController accountsController = Get.find();
  UserController userController = Get.find();

  final nameController = TextEditingController().obs;
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

  void authInit() {
    nameController.value.text = userController.user.value?.userName ?? '';

    ipController.text = apiConnection.getIp ?? '';
    portController.text = apiConnection.getPort ?? '';
  }

  void auth() async {
    errorMessage.value = '';
    if (formKey.currentState!.validate()) {
      authState.value = Status.LOADING;

      apiConnection.setIp = ipController.text.trim();
      apiConnection.setPort = portController.text.trim();
      var result = await authUseCase(
        Tuple2(
          nameController.value.text.trim(),
          passwordController.text.trim(),
        ),
      );
      result.fold((l) {
        errorMessage.value = l.message;
        authState.value = Status.ERROR;
      }, (r) async {
        try {
          authState.value = Status.SUCCESS;
          Get.offAllNamed(Routes.LOADING);
        } catch (e) {
          errorMessage.value = e.toString();
          authState.value = Status.ERROR;
        }
      });
    }
  }

  Future<bool> refreshLogin() async {
    final res = await authUseCase(
      const Tuple2('', ''),
    );

    return res.fold((e) {
      return false;
    }, (_) => true);
  }

  @override
  void onClose() {
    super.onClose();
    nameController.value.dispose();
    ipController.dispose();
    portController.dispose();
    passwordController.dispose();
  }
}
