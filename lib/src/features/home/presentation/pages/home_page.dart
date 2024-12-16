import 'dart:math';

import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/padding_extension.dart';
import 'package:era_pro_application/src/core/routes/app_pages.dart';
import 'package:era_pro_application/src/core/widgets/thin_divider_widget.dart';
import 'package:era_pro_application/src/features/accounts/presentation/getX/accounts_controller.dart';
import 'package:era_pro_application/src/features/home/presentation/widgets/dialy_weekly_chart.dart';
import 'package:era_pro_application/src/features/home/presentation/widgets/home_service_widget.dart';
import 'package:era_pro_application/src/features/home/presentation/widgets/service_sheet.dart';
import 'package:era_pro_application/src/features/user/presentation/widgets/user_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../core/extensions/image_with_error_extension.dart';
import '../../../../core/types/services_type.dart';
import '../../../accounts/domain/entities/account_entity.dart';
import '../../../accounts/presentation/pages/account_add_operation_sheet.dart';

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

class HomeCustomerWidget extends StatefulWidget {
  const HomeCustomerWidget({
    super.key,
  });

  @override
  State<HomeCustomerWidget> createState() => _HomeCustomerWidgetState();
}

class _HomeCustomerWidgetState extends State<HomeCustomerWidget> {
  List<AccountEntity>? accounts;

  @override
  void initState() {
    super.initState();
    accountsController.getAllAccounts().then((onValue) => setState(() {
          accounts = accountsController.customers.value;
        }));
  }

  AccountsController accountsController = Get.find();

  // Function to generate a random color
  Color getRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      200 + random.nextInt(55), // Light red
      200 + random.nextInt(55), // Light green
      200 + random.nextInt(55), // Light blue
    );
  }

  @override
  Widget build(BuildContext context) {
    return accounts != null && accounts!.isEmpty
        ? const SizedBox()
        : Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.ACCOUNTS);
                      },
                      child: Text(
                        'عرض الكل',
                        style:
                            context.bodySmall.copyWith(color: context.primary),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "العملاء",
                      style: context.displayLarge,
                    ),
                  ],
                ),
                context.g12,
                Row(
                  textDirection: TextDirection.rtl,
                  children: accounts
                          ?.take(5)
                          .map(
                            (e) => GestureDetector(
                              onTap: () {
                                Get.bottomSheet(
                                  AccountAddOperationSheet(
                                    account: e,
                                  ),
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: e.image != null
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: CustomImage.memoryWithError(
                                          e.image,
                                          w: 60,
                                          h: 60,
                                        ),
                                      )
                                    : Container(
                                        // width: 60,
                                        constraints: const BoxConstraints(
                                          minWidth: 60,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: getRandomColor(),
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        alignment: Alignment.center,
                                        child: Center(
                                          child: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              e.accName.isNotEmpty
                                                  ? e.accName.split(' ')[
                                                      0] // Get the first name
                                                  : '?',
                                              style: TextStyle(
                                                color: context.blackColor,
                                                fontSize:
                                                    14, // Adjust font size for better fit
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                              ).pl(12),
                            ),
                          )
                          .toList() ??
                      [],
                ),
              ],
            ),
          );
  }
}
