import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/padding_extension.dart';
import 'package:era_pro_application/src/features/accounts/presentation/getX/accounts_controller.dart';
import 'package:era_pro_application/src/features/home/presentation/widgets/home_sammary_widge.dart';
import 'package:era_pro_application/src/features/home/presentation/widgets/home_service_widget.dart';
import 'package:era_pro_application/src/features/user/presentation/widgets/user_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  AccountsController accountsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              UserProfileWidget(),
              context.g28,
              const HomeSammaryWidget(),
              context.g20,
              const ServiceWidget(),
              const SizedBox(
                height: 100,
              ),
            ],
          ).p(20),
        ),
      ),
    );
  }
}
