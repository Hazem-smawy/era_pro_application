import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/features/accounts/presentation/getX/accounts_controller.dart';
import 'package:era_pro_application/src/features/accounts/presentation/pages/accounts_page.dart';
import 'package:era_pro_application/src/features/accounts/presentation/pages/special_accounts_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/search_bar_widget.dart';

class AcountsTabviewPage extends StatelessWidget {
  AcountsTabviewPage({super.key});
  final AccountsController accountsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: null,
          title: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.contacts_outlined,
                  size: 27,
                  color: context.secondaryTextColor,
                ),
              ),
              Expanded(child: SearchAppbarWidget(
                action: (p0) {
                  accountsController.search(p0);
                },
              ))
            ],
          ),
          bottom: TabBar(
            dividerColor: context.secondaryTextColor.withOpacity(0.3),
            labelStyle: context.titleMedium?.copyWith(color: context.primary),
            unselectedLabelColor: context.secondaryTextColor,
            tabs: const [
              Tab(
                text: 'الحسابات',
              ),
              Tab(
                text: 'العملاء',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SpecialAccountsPage(),
            AccountsPage(),
          ],
        ),
      ),
    );
  }
}
