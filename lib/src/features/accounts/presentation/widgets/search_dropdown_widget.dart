// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/features/accounts/domain/entities/account_entity.dart';
import 'package:era_pro_application/src/features/accounts/presentation/getX/accounts_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../pages/add_new_customer_sheet.dart';

class SearchDropdownWidget extends StatelessWidget {
  SearchDropdownWidget({super.key, this.action, required this.initialId});
  final Function(AccountEntity?)? action;
  final int initialId;

  final AccountsController accountsController = Get.find();
  // BillController billController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => accountsController.customers.value.isNotEmpty
          ? Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.bottomSheet(
                      AddNewAccountSheet(),
                      isScrollControlled: true,
                    );
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: context.whiteColor,
                    ),
                    child: Center(
                      child: FaIcon(
                        Icons.person_add,
                        size: 20,
                        color: context.secondaryTextColor,
                      ),
                    ),
                  ),
                ),
                context.g8,
                Expanded(
                  child: SizedBox(
                    height: 55,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: CustomDropdown<AccountEntity>.search(
                        hintText: initialId != 0
                            ? accountsController.allAccounts.value
                                .firstWhere((e) => e.accNumber == initialId)
                                .accName
                            : 'اسم العميل',
                        searchHintText: 'بحث ...',
                        // noResultFoundText: 'لا توجد نتائج',
                        noResultFoundBuilder: (context, e) => GestureDetector(
                          onTap: () {
                            Get.bottomSheet(
                              AddNewAccountSheet(),
                              isScrollControlled: true,
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: context.containerColor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const FaIcon(Icons.person_add),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'اضافة عميل',
                                  style: context.bodyMedium,
                                )
                              ],
                            ),
                          ),
                        ),

                        items: accountsController.customers.value,
                        excludeSelected: false,
                        // overlayHeight: 100,
                        decoration: CustomDropdownDecoration(
                          closedBorderRadius: BorderRadius.circular(20),
                          expandedBorderRadius: BorderRadius.circular(20),
                        ),
                        onChanged: (value) {
                          if (action != null) {
                            action!(value);
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            )
          : const SizedBox(),
    );
  }
}
