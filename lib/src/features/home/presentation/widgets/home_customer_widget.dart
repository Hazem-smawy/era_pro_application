import 'dart:math';

import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/padding_extension.dart';
import 'package:era_pro_application/src/core/routes/app_pages.dart';
import 'package:era_pro_application/src/features/accounts/presentation/getX/accounts_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/extensions/image_with_error_extension.dart';
import '../../../accounts/domain/entities/account_entity.dart';
import '../../../accounts/presentation/pages/account_add_operation_sheet.dart';

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
      230 + random.nextInt(20), // Light red
      230 + random.nextInt(20), // Light green
      230 + random.nextInt(20), // Light blue
    );
  }

  @override
  Widget build(BuildContext context) {
    return accounts != null && accounts!.isEmpty
        ? const SizedBox()
        : Container(
            margin: const EdgeInsets.only(right: 20),
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
                      style: context.displaySmall,
                    ),
                  ],
                ).pl(20),
                context.g12,
                SizedBox(
                  height: 60,
                  child: ListView(
                    reverse: true,
                    scrollDirection: Axis.horizontal,
                    children: (() {
                      // Set the total width minus 40

                      int fittingAccountsCount = 0;

                      // Calculate the fitting accounts
                      final accountWidgets = accounts?.map((e) {
                            // Estimate the width of each account widget

                            // Check if adding the next widget exceeds the available width

                            return GestureDetector(
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
                                          h: 40,
                                        ),
                                      )
                                    : Container(
                                        constraints: const BoxConstraints(
                                          minWidth: 60,
                                          minHeight: 40,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 7,
                                        ),
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
                                                  ? e.accName.split(' ')[0]
                                                  : '?',
                                              style: context.titleMedium,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                              ).pl(12),
                            );
                          }).toList() ??
                          [];

                      // Print or display the number of fitting accounts
                      print('Fitting accounts count: $fittingAccountsCount');

                      return accountWidgets;
                    })(),
                  ),
                ),
              ],
            ),
          );
  }
}
