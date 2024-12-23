import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/padding_extension.dart';
import 'package:era_pro_application/src/core/widgets/thin_divider_widget.dart';
import 'package:era_pro_application/src/features/accounts/presentation/getX/accounts_controller.dart';
import 'package:era_pro_application/src/features/home/presentation/widgets/dialy_weekly_chart.dart';
import 'package:era_pro_application/src/features/home/presentation/widgets/home_customer_widget.dart';
import 'package:era_pro_application/src/features/home/presentation/widgets/home_service_widget.dart';
import 'package:era_pro_application/src/features/home/presentation/widgets/service_sheet.dart';
import 'package:era_pro_application/src/features/user/presentation/widgets/user_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../core/types/services_type.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final AccountsController accountsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  const UserProfileWidget(
                    key: ValueKey('home_page'),
                  ),
                  context.g28,
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: context.secondaryTextColor.withOpacity(0.2),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.arrowTrendUp,
                              size: 20,
                              color: Colors.green,
                            ),
                            context.g4,
                            Text(
                              '122122',
                              textDirection: TextDirection.rtl,
                              style: context.displayLarge,
                            ),
                          ],
                        ),
                        context.g12,
                        Row(
                          children: [
                            Text(
                              '%${22}',
                              style: context.titleMedium.copyWith(
                                color: context.primary,
                              ),
                            ),
                            context.g8,
                            Text(
                              'ضريبة المبيعات:',
                              textDirection: TextDirection.rtl,
                              style: context.bodyLarge,
                            ),
                            const Spacer(),
                            Text(
                              '22',
                              style: context.titleMedium
                                  .copyWith(color: Colors.red),
                            ),
                            context.g8,
                            Text(
                              "الضريبة المضافة:",
                              textDirection: TextDirection.rtl,
                              style: context.bodyLarge,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  context.g20,
                  const HomeServiceWidget()
                ],
              ).p(16),

              // const ThinDividerWidget(),

              const ThinDividerWidget(),
              SizedBox(
                width: context.width,
                height: context.height / 3,
                child: const DailyWeeklyChart(),
              ),
              context.g28,
              const HomeCustomerWidget(),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
