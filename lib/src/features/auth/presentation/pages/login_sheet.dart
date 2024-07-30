import 'package:era_pro_applicationlication/src/core/constants/spaces.dart';
import 'package:era_pro_applicationlication/src/core/constants/strings.dart';
import 'package:era_pro_applicationlication/src/core/extensions/context_extensions.dart';
import 'package:era_pro_applicationlication/src/core/extensions/elvated_btn_extension.dart';
import 'package:era_pro_applicationlication/src/core/widgets/custom_text_filed_widget.dart';
import 'package:era_pro_applicationlication/src/features/auth/presentation/getX/auth_getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginSheet extends StatelessWidget {
  LoginSheet({
    super.key,
  });
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: context.width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: context.surfaceColor,
        ),
        padding: const EdgeInsets.all(Spaces.sp16),
        child: SafeArea(
          child: Form(
            key: authController.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gaps.g20,
                Text(
                  loginSheetTitle,
                  style: context.displayLarge,
                ),
                Gaps.g28,
                CustomTextFieldWidget(
                  controller: authController.nameController,
                  label: 'اسم الموزع',
                ),
                Gaps.g20,
                CustomTextFieldWidget(
                  controller: authController.passwordController,
                  label: 'كلمة المرور',
                ),
                Gaps.g16,
                CustomTextFieldWidget(
                  controller: authController.ipController,
                  label: 'عنوان الاتصال',
                ),
                Gaps.g16,
                CustomTextFieldWidget(
                  controller: authController.portController,
                  label: 'رقم المنفذ',
                ),
                Gaps.g16,
                ElevatedButtonExtension.primary(
                    label: loginSheetTitle,
                    onPressed: () {
                      authController.auth();
                    }),
                Gaps.g36,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
