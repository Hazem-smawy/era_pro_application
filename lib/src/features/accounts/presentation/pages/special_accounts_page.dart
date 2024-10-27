import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/features/accounts/presentation/getX/accounts_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/future_builder_widget.dart';
import '../../domain/entities/account_entity.dart';
import '../widgets/custom_popup_menu_button.dart';

class SpecialAccountsPage extends StatelessWidget {
  SpecialAccountsPage({super.key});
  final AccountsController accountsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ReusableFutureBuilder<List<AccountEntity>>(
      future: accountsController.getSpecailAccounts(),
      builder: (context, data) {
        return ListView.separated(
          shrinkWrap: true,
          primary: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => Container(
            height: 1,
            color: Colors.white,
          ),
          itemCount: data.length,
          itemBuilder: (context, index) => Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                CustomPopupMenuButton(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        data[index].accName,
                        style: context.titleMedium,
                      ),
                      context.g4,
                      Text(
                        data[index].accNumber.toString(),
                        style: context.bodySmall,
                      ),
                    ],
                  ),
                ),
                context.g12,
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    'assets/images/avatar1.jpg',
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
