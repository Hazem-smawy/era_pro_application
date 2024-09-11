import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/features/accounts/presentation/pages/accounts_page.dart';
import 'package:era_pro_application/src/features/accounts/presentation/pages/special_accounts_page.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/search_bar_widget.dart';

class AcountsTabviewPage extends StatelessWidget {
  const AcountsTabviewPage({super.key});

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
              const Expanded(child: SearchAppbarWidget())
            ],
          ),
          bottom: TabBar(
            dividerColor: context.secondaryTextColor.withOpacity(0.3),
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
