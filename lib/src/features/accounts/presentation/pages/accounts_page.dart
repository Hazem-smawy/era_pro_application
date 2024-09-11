import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/padding_extension.dart';
import 'package:era_pro_application/src/core/widgets/future_builder_widget.dart';
import 'package:era_pro_application/src/features/accounts/domain/entities/account_entity.dart';
import 'package:era_pro_application/src/features/accounts/presentation/getX/accounts_controller.dart';
import 'package:era_pro_application/src/features/accounts/presentation/pages/account_details_page.dart';
import 'package:era_pro_application/src/features/accounts/presentation/pages/add_new_account_sheet.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/search_bar_widget.dart';
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
              //title

              ReusableFutureBuilder<List<AccountEntity>>(
                future: accountsController.getAllAccounts(),
                builder: (context, data) {
                  return ListView.separated(
                    shrinkWrap: true,
                    primary: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => Container(
                      color: Colors.white,
                      height: 2,
                    ),
                    itemCount: data.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Get.to(
                          () => AccountDetailsPage(
                            accountEntity: data[index],
                          ),
                        );
                      },
                      child: AccountItemWidget(
                        accountEntity: data[index],
                      ),
                    ),
                  );
                },
              ),

              context.g16,
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.primaryColor,
        onPressed: () {
          Get.bottomSheet(AddNewAccountSheet());
        },
        child: FaIcon(
          FontAwesomeIcons.plus,
          color: context.wightColor,
        ),
      ),
    );
  }
}
