import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/features/accounts/presentation/getX/accounts_controller.dart';
import 'package:era_pro_application/src/features/accounts/presentation/pages/account_details_page.dart';
import 'package:era_pro_application/src/features/accounts/presentation/pages/add_new_customer_sheet.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../widgets/account_item_widget.dart';

class AccountsPage extends StatelessWidget {
  AccountsPage({super.key});
  final AccountsController accountsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Obx(() => accountsController.customers.value.isEmpty
                  ? const SizedBox()
                  : ListView.separated(
                      shrinkWrap: true,
                      primary: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => Container(
                        color: Colors.white,
                        height: 2,
                      ),
                      itemCount: accountsController.customers.value.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Get.to(
                            () => AccountDetailsPage(
                              accountEntity:
                                  accountsController.customers.value[index],
                            ),
                          );
                        },
                        child: AccountItemWidget(
                          accountEntity:
                              accountsController.customers.value[index],
                        ),
                      ),
                    )),
              //title

              context.g16,
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.primaryColor,
        onPressed: () {
          Get.bottomSheet(
            AddNewAccountSheet(),
            isScrollControlled: true,
          );
        },
        child: FaIcon(
          FontAwesomeIcons.plus,
          color: context.wightColor,
        ),
      ),
    );
  }
}
