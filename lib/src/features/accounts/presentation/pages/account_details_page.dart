import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/padding_extension.dart';
import 'package:era_pro_application/src/core/widgets/categories_widget.dart';
import 'package:era_pro_application/src/core/widgets/header_widget.dart';
import 'package:era_pro_application/src/features/accounts/domain/entities/account_entity.dart';
import 'package:era_pro_application/src/features/accounts/presentation/pages/account_add_operation_sheet.dart';
import 'package:era_pro_application/src/features/accounts/presentation/widgets/cirecle_icon_btn_widget.dart';
import 'package:era_pro_application/src/features/accounts/presentation/widgets/details_accounts_info_item.dart';
import 'package:era_pro_application/src/features/accounts/presentation/widgets/details_operation_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AccountDetailsPage extends StatelessWidget {
  const AccountDetailsPage({
    super.key,
    required this.accountEntity,
  });
  final AccountEntity accountEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            context.g8,
            const HeaderWidget(
              title: '',
            ).ph(10),
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  //backgroundColor: const Color(0xffF7BC56),
                  child: Image.asset(
                    'assets/images/avatar1.jpg',
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                context.g8,
                Text(
                  accountEntity.accName,
                  style: context.titleMedium,
                ),
                context.g16,
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: context.secondaryTextColor.withOpacity(0.4),
                    ),
                  ),
                  child: Text(
                    'تعد يل',
                    style: context.bodyLarge,
                  ).phv(
                    h: 20,
                    v: 5,
                  ),
                ),
              ],
            ),
            context.g16,
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: context.whiteColor.withOpacity(0.9),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DetailsAccountsInfoItem(
                    icon: Icons.phone,
                    value: accountEntity.accPhone,
                  ),
                  context.g16,
                  DetailsAccountsInfoItem(
                    icon: Icons.location_on_outlined,
                    value: accountEntity.address,
                  ),
                ],
              ),
            ),

            context.g20,
            // details
            Expanded(
              child: AnimatedContainer(
                duration: const Duration(microseconds: 200),
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                      child: Row(
                        children: [
                          context.g16,
                          CircleIconBtnWidget(
                            icon: FontAwesomeIcons.plus,
                            action: () {
                              Get.bottomSheet(
                                const AccountAddOperationSheet(),
                                elevation: 0,
                              );
                            },
                          ),
                          context.g8,
                          Expanded(
                            child: CategoriesWidget(
                              items: const [
                                {
                                  'name': 'السندات',
                                  'id': 1,
                                },
                                {
                                  'name': 'الفواتير',
                                  'id': 2,
                                },
                              ],
                              action: (id) {},
                              selectedId: 0,
                              idExtractor: (item) => item['id'] as int,
                              nameExtractor: (item) => item['name'] as String,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        separatorBuilder: (context, index) => const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: SizedBox(),
                        ),
                        // padding: const EdgeInsets.all(10),
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return const DetailsOperationItemWidget();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )

            // end
          ],
        ),
      ),
    );
  }
}
