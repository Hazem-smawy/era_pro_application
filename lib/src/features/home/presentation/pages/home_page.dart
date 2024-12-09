import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/padding_extension.dart';
import 'package:era_pro_application/src/core/widgets/loading_widget.dart';
import 'package:era_pro_application/src/core/widgets/thin_divider_widget.dart';
import 'package:era_pro_application/src/features/accounts/presentation/getX/accounts_controller.dart';
import 'package:era_pro_application/src/features/bills/presentation/pages/all_bills_page.dart';
import 'package:era_pro_application/src/features/bills/presentation/widgets/bill_widget/bill_item_widget.dart';
import 'package:era_pro_application/src/features/home/presentation/getX/home_controller.dart';
import 'package:era_pro_application/src/features/home/presentation/widgets/daily_chart.dart';
import 'package:era_pro_application/src/features/home/presentation/widgets/dialy_weekly_chart.dart';
import 'package:era_pro_application/src/features/home/presentation/widgets/home_service_widget.dart';
import 'package:era_pro_application/src/features/home/presentation/widgets/service_sheet.dart';
import 'package:era_pro_application/src/features/user/presentation/widgets/user_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../core/types/services_type.dart';
import '../widgets/show_charts.dart';

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
                  const UserProfileWidget(),
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
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "الخدمات",
                      style: context.displayLarge,
                    ),
                  ),
                  context.g12,
                  Align(
                    alignment: Alignment.centerRight,
                    child: Wrap(
                      alignment: WrapAlignment.end,
                      runAlignment: WrapAlignment.end,
                      crossAxisAlignment: WrapCrossAlignment.end,
                      spacing: context.sp20,
                      runSpacing: context.sp20,
                      children: [
                        ServiceItemWidget(
                          color: Colors.grey,
                          action: () {
                            Get.bottomSheet(const ServiceSheet());
                          },
                          label: 'المزيد',
                          icon: Icons.grid_view_rounded,
                        ),
                        ...ServicesType.values
                            .take(3)
                            .map((service) => ServiceItemWidget(
                                  color: service.color,
                                  label: service.name,
                                  icon: service.icon,
                                  action: () {
                                    service.action();
                                  },
                                ))
                      ],
                    ),
                  ),
                ],
              ).p(16),

              // const ThinDividerWidget(),

              // RecentBillWidget(),
              // SizedBox(
              //   height: context.height / 3,
              //   child: ChartWidget(),
              // ),
              // SizedBox(
              //   height: context.height / 3,
              //   child: DialyChartWidget(),
              // ),
              const ThinDividerWidget(),
              SizedBox(
                width: context.width,
                height: context.height / 3,
                child: const DailyWeeklyChart(),
              ),
              // SizedBox(
              //   height: context.height / 2.5,
              //   child: CDailyWeeklyChart(),
              // ),
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
