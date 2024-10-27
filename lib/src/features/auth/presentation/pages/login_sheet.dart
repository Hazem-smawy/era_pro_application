import 'package:era_pro_application/src/core/constants/spaces_sizes.dart';
import 'package:era_pro_application/src/core/constants/strings.dart';
import 'package:era_pro_application/src/core/extensions/button_extension.dart';
import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/elvated_btn_extension.dart';
import 'package:era_pro_application/src/core/types/status_types.dart';
import 'package:era_pro_application/src/core/widgets/custom_text_filed_widget.dart';
import 'package:era_pro_application/src/features/auth/presentation/getX/auth_getx.dart';
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'اسم الموزع مطلوب';
                    }
                    return null;
                  },
                ),
                Gaps.g20,
                CustomTextFieldWidget(
                  controller: authController.passwordController,
                  label: 'كلمة المرور',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'كلمة المرور  مطلوب';
                    }
                    return null;
                  },
                ),
                Gaps.g16,
                CustomTextFieldWidget(
                  controller: authController.ipController,
                  label: 'عنوان الاتصال',
                  isNumber: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'عنوان الاتصال مطلوب';
                    }
                    return null;
                  },
                ),
                Gaps.g16,
                CustomTextFieldWidget(
                  controller: authController.portController,
                  label: 'رقم المنفذ',
                  isNumber: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'رقم المنفذ مطلوب';
                    }
                    return null;
                  },
                ),
                Gaps.g16,
                Obx(
                  () => Column(
                    children: [
                      ElevatedButtonExtension.primary(
                        label: loginSheetTitle,
                        onPressed: () {
                          authController.auth();
                        },
                      ).status(authController.authState.value.isLoading()),
                      Gaps.g16,
                      if (authController.authState.value.isLoading())
                        const SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(),
                        ),
                      if (authController.errorMessage.value != '')
                        Text(authController.errorMessage.value),
                    ],
                  ),
                ),
                Gaps.g36,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
