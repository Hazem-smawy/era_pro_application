import 'package:encrypt/encrypt.dart';
import 'package:era_pro_applicationlication/src/core/api/api.dart';
import 'package:era_pro_applicationlication/src/core/utils/encryptAndDecryptUtils.dart';
import 'package:era_pro_applicationlication/src/features/auth/presentation/getX/auth_getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});
  final AuthController authController = Get.find();
  final ApiConnection apiConnection = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          child: const Text('Auth Page'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              apiConnection.setIp = "192.168.2.29";
              apiConnection.setPort = "10222";
              authController.username.value = "dd";
              authController.password.value = "d";

              authController.auth();
            },
            child: const Center(
              child: Text("helo"),
            ),
          )
        ],
      ),
    );
  }
}
