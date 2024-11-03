// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:era_pro_application/src/features/accounts/domain/entities/account_entity.dart';
import 'package:era_pro_application/src/features/accounts/presentation/getX/accounts_controller.dart';
import 'package:era_pro_application/src/features/bills/presentation/getX/bills_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchDropdownWidget extends StatelessWidget {
  SearchDropdownWidget({super.key});

  final AccountsController accountsController = Get.find();
  ItemController itemController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => accountsController.allAccounts.value.isNotEmpty
          ? SizedBox(
              height: 50,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: CustomDropdown<AccountEntity>.search(
                  hintText: 'اسم العميل',
                  searchHintText: 'بحث ...',
                  noResultFoundText: 'لا توجد نتائج',
                  items: accountsController.allAccounts.value,
                  excludeSelected: false,
                  // overlayHeight: 100,
                  decoration: CustomDropdownDecoration(
                    closedBorderRadius: BorderRadius.circular(20),
                    expandedBorderRadius: BorderRadius.circular(20),
                  ),
                  onChanged: (value) {
                    itemController.newBill.value?.customerName =
                        value?.accName ?? '';
                    log('change value to: ${itemController.newBill.value?.customerName}');
                  },
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}

// const List<Job> _list3 = [
//   Job('Developer', Icons.developer_mode),
//   Job('Designer', Icons.design_services),
//   Job('Consultant', Icons.account_balance),
//   Job('Student', Icons.school),
// ];

// class MultiSelectSearchDropdown extends StatelessWidget {
//   const MultiSelectSearchDropdown({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CustomDropdown<Job>.multiSelectSearch(
//       hintText: 'Select job role',
//       items: _list3,
//       onListChanged: (value) {
//         log('changing value to: $value');
//       },
//     );
//   }
// }
