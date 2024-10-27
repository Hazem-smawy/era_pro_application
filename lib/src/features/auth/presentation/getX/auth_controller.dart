// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/core/api/api.dart';
import 'package:era_pro_application/src/core/types/status_types.dart';
import 'package:era_pro_application/src/features/accounts/presentation/getX/accounts_controller.dart';
import 'package:era_pro_application/src/features/auth/domain/usecases/usecases.dart';
import 'package:era_pro_application/src/features/main_info/presentation/getX/main_info_controller.dart';
import 'package:era_pro_application/src/features/store/presentation/getX/store_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/routes/app_pages.dart';

class AuthController extends GetxController {
  MainInfoController mainInfoController = Get.find();
  StoreController storeController = Get.find();
  AccountsController accountsController = Get.find();
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
        Tuple2(nameController.text.trim(), passwordController.text.trim()),
      );
      result.fold((l) {
        errorMessage.value = l.message;
        authState.value = Status.ERROR;
      }, (r) async {
        try {
          await mainInfoController.getAllMainInfo();
          await storeController.getAllStoreInfo();
          await accountsController.getAllAccounts();
          Get.offAllNamed(Routes.BOTTOMNAVIGATIONBAR);
          authState.value = Status.SUCCESS;
        } catch (e) {
          errorMessage.value = e.toString();
          authState.value = Status.ERROR;
        }
      });
    }
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    ipController.dispose();
    portController.dispose();
    passwordController.dispose();
  }
}
