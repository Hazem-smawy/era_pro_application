import 'package:era_pro_applicationlication/src/core/constants/spaces.dart';
import 'package:era_pro_applicationlication/src/core/constants/strings.dart';
import 'package:era_pro_applicationlication/src/core/extensions/context_extensions.dart';
import 'package:era_pro_applicationlication/src/core/extensions/elvated_btn_extension.dart';
import 'package:era_pro_applicationlication/src/core/extensions/padding_extension.dart';
import 'package:era_pro_applicationlication/src/features/auth/presentation/pages/login_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primary,
      body: Column(
        children: [
          const Spacer(),
          const Icon(
            Icons.ac_unit_sharp,
            size: 60,
            color: Colors.white,
          ),
          Gaps.g8,
          Text(
            intoAppNameString,
            style: context.titleLarge?.copyWith(color: context.wightColor),
          ),
          Gaps.g4,
          Text(
            intoAppDescriptionString,
            style: context.titleSmall?.copyWith(
              color: context.containerColor,
            ),
          ),
          const Spacer(),
          Column(
            children: [
              ElevatedButtonExtension.secondary(
                label: intoBtnString,
                onPressed: () {
                  Get.bottomSheet(
                    LoginSheet(),
                    isScrollControlled: true,
                  );
                },
              )
            ],
          ),
        ],
      ).p(40).pb(50),
    );
  }
}
