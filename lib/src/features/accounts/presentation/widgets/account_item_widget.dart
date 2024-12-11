import 'package:era_pro_application/src/core/constants/spaces_sizes.dart';
import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/features/accounts/domain/entities/account_entity.dart';
import 'package:era_pro_application/src/features/accounts/presentation/widgets/cirecle_icon_btn_widget.dart';
import 'package:era_pro_application/src/features/accounts/presentation/widgets/custom_popup_menu_button.dart';
import 'package:era_pro_application/src/features/accounts/presentation/widgets/text_btn_with_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../pages/account_add_operation_sheet.dart';

class AccountItemWidget extends StatelessWidget {
  final AccountEntity accountEntity;
  const AccountItemWidget({
    super.key,
    required this.accountEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CustomPopupMenuButton(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      accountEntity.accName,
                      style: context.titleMedium,
                    ),
                    Text(
                      accountEntity.accPhone,
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
          Gaps.g8,
          Row(
            children: [
              context.g4,
              CircleIconBtnWidget(
                icon: FontAwesomeIcons.phone,
                action: () {},
              ),
              context.g12,
              CircleIconBtnWidget(
                icon: FontAwesomeIcons.whatsapp,
                action: () {},
              ),
              const Spacer(),
              TextBtnWithIconWidget(
                label: 'اضافة عملية',
                color: context.primary,
                action: () {
                  Get.bottomSheet(
                    AccountAddOperationSheet(
                      account: accountEntity,
                    ),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
