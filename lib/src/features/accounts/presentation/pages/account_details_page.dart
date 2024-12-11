import 'dart:ffi';

import 'package:era_pro_application/src/core/constants/assets.dart';
import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/padding_extension.dart';
import 'package:era_pro_application/src/core/widgets/categories_widget.dart';
import 'package:era_pro_application/src/core/widgets/empty_widget.dart';
import 'package:era_pro_application/src/core/widgets/header_widget.dart';
import 'package:era_pro_application/src/features/accounts/domain/entities/account_entity.dart';
import 'package:era_pro_application/src/features/accounts/presentation/getX/accounts_controller.dart';
import 'package:era_pro_application/src/features/accounts/presentation/pages/account_add_operation_sheet.dart';
import 'package:era_pro_application/src/features/accounts/presentation/pages/add_new_customer_sheet.dart';
import 'package:era_pro_application/src/features/accounts/presentation/widgets/cirecle_icon_btn_widget.dart';
import 'package:era_pro_application/src/features/accounts/presentation/widgets/details_accounts_info_item.dart';
import 'package:era_pro_application/src/features/accounts/presentation/widgets/details_operation_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AccountDetailsPage extends StatelessWidget {
  AccountDetailsPage({
    super.key,
    required this.accountEntity,
  });
  final AccountEntity accountEntity;
  AccountsController accountsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      body: SafeArea(
        bottom: false,
        child: Obx(() {
          AccountEntity account = accountsController.customers.value.firstWhere(
            (e) => e.accNumber == accountEntity.accNumber,
          );
          return SingleChildScrollView(
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
                      account.accName,
                      style: context.titleMedium,
                    ),
                    context.g8,
                    GestureDetector(
                      onTap: () async {
                        Get.bottomSheet(
                          AddNewAccountSheet(
                            account: account,
                          ),
                          isScrollControlled: true,
                        ).then((value) {
                          // print(value);
                          account =
                              accountsController.customers.value.firstWhere(
                            (e) => e.accNumber == accountEntity.accNumber,
                          );
                          print(account.accName);
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          // border: Border.all(
                          //   color: context.secondaryTextColor.withOpacity(0.4),
                          // ),
                          color: context.primary,
                        ),
                        child: Text(
                          'تعديل',
                          style: context.bodyLarge.copyWith(
                            color: context.whiteColor,
                          ),
                        ).phv(
                          h: 20,
                          v: 10,
                        ),
                      ),
                    ),
                  ],
                ),
                context.g16,
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: context.secondaryTextColor.withOpacity(0.2),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      account.accNumber.toString(),
                      style: context.titleSmall.copyWith(
                        color: context.blackColor,
                      ),
                    ),
                  ),
                ),
                context.g8,
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: context.secondaryTextColor.withOpacity(0.2),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DetailsAccountsInfoItem(
                        icon: Icons.phone,
                        value: account.accPhone,
                      ),
                      context.g16,
                      DetailsAccountsInfoItem(
                        icon: Icons.location_on_outlined,
                        value: account.address,
                      ),
                    ],
                  ),
                ),

                context.g20,
                // details
                OperationListWidget(
                  account: account,
                ),
                context.g20,

                // end
              ],
            ),
          );
        }),
      ),
    );
  }
}

class OperationListWidget extends StatefulWidget {
  final AccountEntity account;
  const OperationListWidget({
    super.key,
    required this.account,
  });

  @override
  State<OperationListWidget> createState() => _OperationListWidgetState();
}

class _OperationListWidgetState extends State<OperationListWidget>
    with SingleTickerProviderStateMixin {
  AccountsController accountsController = Get.find();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    accountsController.getOperationForCustomer(widget.account.accNumber);

    // Initialize animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    // Create a fade animation
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    // Start the animation
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
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
                      AccountAddOperationSheet(
                        account: widget.account,
                      ),
                      elevation: 0,
                    );
                  },
                ),
                context.g8,
                Obx(
                  () => Expanded(
                    child: CategoriesWidget(
                      items: const [
                        {
                          'name': 'الفواتير',
                          'id': 2,
                        },
                        {
                          'name': 'السندات',
                          'id': 1,
                        },
                      ],
                      action: (id) {
                        accountsController.selectedOperationType.value =
                            id ?? 0;
                        accountsController.filterdOperationForCustomer(id ?? 0);
                      },
                      selectedId:
                          accountsController.selectedOperationType.value,
                      idExtractor: (item) => item['id'] as int,
                      nameExtractor: (item) => item['name'] as String,
                    ),
                  ),
                )
              ],
            ),
          ),
          Obx(() {
            switch (accountsController.customerOperationStatus.value) {
              case RxStatus.loading:
                // Show a loading indicator with animation
                return FadeTransition(
                  opacity: _fadeAnimation,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              case CustomerOperationStatus.empty:
                // Show a message for empty state with animation
                return FadeTransition(
                  opacity: _fadeAnimation,
                  child: SizedBox(
                    height: context.height / 2,
                    child: const EmptyWidget(
                      imageName: Assets.assetsImagesCurencies,
                      label: 'لاتوجد اي عمليات',
                    ),
                  ),
                );
              case CustomerOperationStatus.success:
                // Show the list if data is available with animation
                return FadeTransition(
                  opacity: _fadeAnimation,
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    separatorBuilder: (context, index) => context.g8,
                    itemCount: accountsController
                        .filteredAccountsOperationForCustomer.value.length,
                    itemBuilder: (BuildContext context, int index) {
                      final operation = accountsController
                          .filteredAccountsOperationForCustomer.value[index];
                      return DetailsOperationItemWidget(
                        type: operation.operationType,
                        price: operation.operationCredit -
                            operation.operationDebit,
                        date: operation.operationDate,
                        currencySymbole: accountsController.currencies.value
                            .firstWhere((e) => e.id == operation.currencyId)
                            .symbol,
                        number: operation.operationId,
                      );
                    },
                  ),
                );
              default:
                // Handle unexpected states or errors with animation
                return FadeTransition(
                  opacity: _fadeAnimation,
                  child: const Center(
                    child: Text(
                      "An unexpected error occurred.",
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  ),
                );
            }
          }),
        ],
      ),
    );
  }
}
