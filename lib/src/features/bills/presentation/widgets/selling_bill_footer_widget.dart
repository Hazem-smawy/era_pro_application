import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/features/bills/presentation/getX/bills_getx.dart';
import 'package:era_pro_application/src/features/bills/presentation/pages/complete_selling_bill_page.dart';
import 'package:era_pro_application/src/features/bills/presentation/pages/selected_item_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import 'package:qrscan/qrscan.dart' as scanner;

class SellingFooterWidget extends StatefulWidget {
  const SellingFooterWidget({super.key});

  @override
  State<SellingFooterWidget> createState() => _SellingFooterWidgetState();
}

class _SellingFooterWidgetState extends State<SellingFooterWidget> {
  ItemController itemController = Get.find();
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        duration: const Duration(microseconds: 200),
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(microseconds: 200),
              height: 60,
              // padding: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: context.containerColor,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 0),
                      color: context.blackColor.withOpacity(0.03),
                      spreadRadius: 20,
                      blurRadius: 10,
                    )
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: FittedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          children: [
                            Text(
                              'السعر الاجمالي',
                              style: context.bodySmall,
                            ),
                            FittedBox(
                              child: Text(
                                itemController.newBill.value?.totalPrice
                                        .toString() ??
                                    "0",
                                style: context.titleSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: context.blackColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 1,
                    color: context.secondaryTextColor.withOpacity(0.5),
                  ),
                  Expanded(
                    child: FittedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          children: [
                            Text(
                              'عدد المنتجات',
                              style: context.bodySmall,
                            ),
                            Text(
                              itemController.newBill.value?.numberOfItems
                                      .toString() ??
                                  '0',
                              style: context.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: context.blackColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => SelectedItemsScreen());
                    },
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: context.secondary,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Center(
                        child: Text(
                          result.length > 2 ? result : "عرض الفاتورة",
                          style: context.bodySmall?.copyWith(
                            color: context.bg,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            context.g16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FooterBtnWidget(
                  icon: FontAwesomeIcons.barcode,
                  label: 'قارىء الباركود',
                  action: () async {
                    String? cameraScanResult = await scanner.scan();

                    setState(() {
                      result = cameraScanResult ?? "no found";
                    });
                  },
                ),
                FooterBtnWidget(
                  action: () {
                    Get.to(() => CompleteSellingBillPage());
                  },
                  icon: FontAwesomeIcons.moneyBill,
                  label: 'دفع الفاتورة',
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FooterBtnWidget extends StatelessWidget {
  FooterBtnWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.action,
  });
  final IconData icon;
  final String label;
  VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        action();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: context.secondary,
        ),
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            Text(
              label,
              style: context.bodyMeduim?.copyWith(
                color: context.wightColor,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Icon(
              icon,
              color: context.wightColor,
              size: 20,
            ),
            const SizedBox(
              width: 5,
            ),
          ],
        ),
      ),
    );
  }
}
