import 'package:era_pro_application/src/core/constants/spaces_sizes.dart';
import 'package:era_pro_application/src/core/constants/strings.dart';
import 'package:era_pro_application/src/core/extensions/button_extension.dart';
import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/elvated_btn_extension.dart';
import 'package:era_pro_application/src/core/types/status_types.dart';
import 'package:era_pro_application/src/core/widgets/custom_text_filed_widget.dart';
import 'package:era_pro_application/src/features/auth/presentation/getX/auth_getx.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/utils/dialogs.dart';

class LoginSheet extends StatefulWidget {
  final bool isLogin;
  const LoginSheet({
    super.key,
    required this.isLogin,
  });

  @override
  State<LoginSheet> createState() => _LoginSheetState();
}

class _LoginSheetState extends State<LoginSheet> {
  final AuthController authController = Get.find();

  @override
  void initState() {
    super.initState();
    authController.authInit();
  }

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
          child: Obx(
            () => Form(
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
                    controller: authController.nameController.value,
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
                  Column(
                    children: [
                      ElevatedButtonExtension.primary(
                        label: loginSheetTitle,
                        onPressed: () async {
                          if (widget.isLogin) {
                            bool isConnect =
                                await authController.refreshLogin();

                            if (isConnect) {
                              Get.back();
                              CustomDialog.showDialog(
                                color: AppColors.primaryColor,
                                icon: FontAwesomeIcons.circleCheck,
                                title: 'الإتصال',
                                description: 'نجح الإتصال ب السرفر',
                                action: () async {
                                  Get.back();
                                },
                              );

                              await Future.delayed(
                                const Duration(
                                  seconds: 2,
                                ),
                              );
                              if (Get.isDialogOpen != null &&
                                  Get.isDialogOpen == true) {
                                Get.back();
                              }
                            } else {
                              Get.back();
                              CustomDialog.customSnackBar(
                                'تأكد من ان متصل ب الأنترنت',
                                SnackPosition.TOP,
                                true,
                              );
                            }
                          } else {
                            authController.auth();
                          }
                        },
                      ).status(authController.authState.value.isLoading()),
                      Gaps.g16,
                      if (authController.errorMessage.value != '')
                        Text(
                          authController.errorMessage.value,
                        ),
                    ],
                  ),
                  Gaps.g36,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
