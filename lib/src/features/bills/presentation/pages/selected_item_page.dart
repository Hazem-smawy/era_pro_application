// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/widgets/header_widget.dart';
import 'package:era_pro_application/src/features/bills/presentation/pages/complete_selling_bill_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getX/bills_controller.dart';
import '../widgets/selling_bill_item_widget.dart';

// ignore: must_be_immutable
class SelectedItemsScreen extends StatelessWidget {
  SelectedItemsScreen({super.key});
  ItemController itemController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const HeaderWidget(
                title: 'فاتورة مبيعات',
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: context.wightColor,
                  ),
                  child: Obx(
                    () => itemController.cart.isEmpty
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/empty_file.png',
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                              Text(
                                'لم تقم بإضافة اي منتج الى الفاتورة',
                                style: context.bodyLarge,
                              ),
                            ],
                          )
                        : Directionality(
                            textDirection: TextDirection.rtl,
                            child: GridView.builder(
                              dragStartBehavior: DragStartBehavior.down,
                              padding: const EdgeInsets.only(bottom: 50),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.64,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              itemCount: itemController.cart.length,
                              itemBuilder: (BuildContext context, int index) {
                                final item = Rx(itemController.cart[index]);
                                return SellingBillItemWiget(
                                  index: index,
                                  item: item,
                                  isCart: true,
                                );
                              },
                            ),
                          ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: context.secondaryTextColor.withOpacity(0.2),
                  ),
                ),
                child: Obx(
                  () => Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            itemController.newBill.value?.numberOfItems
                                    .toString() ??
                                '',
                            style: context.titleLarge,
                          ),
                          const Spacer(),
                          Text(
                            'عدد القطع',
                            style: context.bodyMeduim,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            itemController.newBill.value?.totalPrice
                                    .toString() ??
                                '0',
                            style: context.bodyLarge,
                          ),
                          const Spacer(),
                          Text(
                            'إجمالي المبلغ',
                            style: context.bodyLarge,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Row(
                  children: [
                    SellingBillBtnWidget(),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SellingBillBtnWidget extends StatelessWidget {
  const SellingBillBtnWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Get.to(() => CompleteSellingBillPage());
        },
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: context.primaryColor,
          ),
          child: Center(
            child: Text(
              'دفع الفاتورة',
              // textAlign: TextAlign.center,
              style: context.titleLarge?.copyWith(
                color: context.wightColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
