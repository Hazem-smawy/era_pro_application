import 'package:era_pro_application/src/core/constants/assets.dart';
import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/features/accounts/domain/entities/account_entity.dart';
import 'package:era_pro_application/src/features/accounts/presentation/getX/accounts_controller.dart';
import 'package:era_pro_application/src/features/accounts/presentation/pages/account_details_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../core/extensions/image_with_error_extension.dart';
import '../../../../core/routes/app_pages.dart';
import '../../../exchange_receipt/presentation/pages/add_new_exchange_sheet.dart';

class AccountAddOperationSheet extends StatelessWidget {
  AccountAddOperationSheet({super.key, required this.account});
  AccountEntity account;
  AccountsController accountsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(top: 30),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: context.whiteColor.withOpacity(0.7),
        ),
        child: GestureDetector(
          onTap: () {
            Get.back();
            Get.to(() => AccountDetailsPage(accountEntity: account));
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                //backgroundColor: const Color(0xffF7BC56),
                child: account.image != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: CustomImage.memoryWithError(
                          account.image,
                          w: 70,
                          h: 70,
                        ),
                      )
                    : Image.asset(
                        Assets.assetsImagesAvatar1,
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                account.accName,
                style: context.titleLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                // height: 70,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: context.containerColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: context.secondaryTextColor.withOpacity(0.5),
                        ),
                      ),
                      child: const FaIcon(
                        FontAwesomeIcons.plus,
                        color: Colors.black87,
                        size: 20,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomerAddSheetItemWidget(
                            icon: FontAwesomeIcons.arrowTurnDown,
                            label: 'فاتورة مرتجع',
                            color: Colors.black87,
                            action: () {
                              Get.back();
                              Get.toNamed(Routes.SELLINGPAGE, arguments: {
                                'type': 9,
                                'customerId': account.accNumber
                              })?.then((value) {
                                accountsController.getOperationForCustomer(
                                    account.accNumber, account.refNumber);
                              });
                            },
                          ),
                          CustomerAddSheetItemWidget(
                            icon: FontAwesomeIcons.arrowUpFromBracket,
                            label: 'فاتورة بيع',
                            color: Colors.black87,
                            action: () {
                              Get.back();
                              Get.toNamed(Routes.SELLINGPAGE, arguments: {
                                'type': 8,
                                'customerId': account.accNumber
                              })?.then((value) {
                                accountsController.getOperationForCustomer(
                                    account.accNumber, account.refNumber);
                              });
                            },
                          ),
                          CustomerAddSheetItemWidget(
                            icon: FontAwesomeIcons.arrowRightArrowLeft,
                            label: 'سند',
                            color: Colors.black87,
                            action: () {
                              Get.back();
                              Get.bottomSheet(
                                AddNewExhangeSheet(
                                  customerId: account.accNumber,
                                ),
                                isScrollControlled: true,
                                elevation: 0,
                              ).then((value) {
                                accountsController.getOperationForCustomer(
                                    account.accNumber, account.refNumber);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomerAddSheetItemWidget extends StatelessWidget {
  const CustomerAddSheetItemWidget({
    required this.icon,
    required this.label,
    required this.color,
    required this.action,
    super.key,
  });
  final IconData icon;
  final String label;
  final Color color;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        action();
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            FaIcon(
              icon,
              color: color,
              size: 20,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              label,
              style: context.bodyLarge,
            )
          ],
        ),
      ),
    );
  }
}
