// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/elvated_btn_extension.dart';
import 'package:era_pro_application/src/core/widgets/custom_text_field_with_label_widget.dart';
import 'package:era_pro_application/src/core/widgets/header_widget.dart';
import 'package:era_pro_application/src/features/bills/presentation/getX/bills_getx.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/custom_text_filed_widget.dart';

class CompleteSellingBillPage extends StatelessWidget {
  CompleteSellingBillPage({super.key});
  ItemController itemController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: HeaderWidget(
                  title: 'تأكيد الفاتورة',
                ),
              ),
              context.g12,
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Row(
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: context.wightColor,
                      ),
                      child: Center(
                        child: FaIcon(
                          FontAwesomeIcons.barcode,
                          size: 20,
                          color: context.secondaryTextColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: CustomTextFieldWidget(
                        hint: 'اسم العميل',
                        controller: itemController.customerName,
                      ),
                    ),
                  ],
                ),
              ),
              const DividerWidget(),
              CompleteSellingBillSummaryItemWidget(
                label: 'الخصم',
                value: itemController.newBill.value?.discount.toString() ?? '',
              ),
              context.g8,
              CompleteSellingBillSummaryItemWidget(
                label: 'الضريبة',
                value: itemController.newBill.value?.tax.toString() ?? '',
              ),
              context.g8,
              CompleteSellingBillSummaryItemWidget(
                label: 'اجمالي الفاتورة',
                value:
                    itemController.newBill.value?.totalPrice.toString() ?? '',
              ),
              context.g16,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: CustomTextFieldWithLabelWidget(
                          textHint:
                              '${itemController.newBill.value?.addDiscountRate}',
                          label: 'مبلغ',
                          action: (p0) {
                            if (p0.isNotEmpty) {
                              itemController.newBill.value?.addDiscountRate =
                                  double.parse(p0);
                            } else {
                              itemController.newBill.value?.addDiscountRate = 0;
                            }
                            itemController.updateBill();
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: CustomTextFieldWithLabelWidget(
                          textHint:
                              '${itemController.newBill.value?.addDiscountPercent} %',
                          label: 'نسبة',
                          action: (p0) {
                            if (p0.isNotEmpty) {
                              itemController.newBill.value?.addDiscountPercent =
                                  double.parse(p0);
                            } else {
                              itemController.newBill.value?.addDiscountPercent =
                                  0;
                            }
                            itemController.updateBill();
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      'خصم إضافي',
                      style: context.titleMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: CustomTextFieldQuantityWidget(
                          textHint:
                              '${itemController.newBill.value?.addTaxRate}',
                          label: 'مبلغ',
                          action: (p0) {
                            if (p0.trim().isNotEmpty && p0 != '0') {
                              print('p0: $p0');
                              itemController.newBill.value?.addTaxRate =
                                  double.parse(p0);
                            } else {
                              print('p0: $p0');
                              itemController.newBill.value?.addTaxRate = 0;
                            }
                            itemController.updateBill();
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: CustomTextFieldWithLabelWidget(
                          textHint:
                              '${itemController.newBill.value?.addTaxPercent} %',
                          label: 'نسبة',
                          action: (p0) {
                            if (p0.isNotEmpty) {
                              itemController.newBill.value?.addTaxPercent =
                                  double.parse(p0);
                            } else {
                              itemController.newBill.value?.addTaxPercent = 0;
                            }
                            itemController.updateBill();
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      'الضريبة المضافة',
                      style: context.titleMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(() => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: context.secondaryTextColor.withOpacity(0.2),
                      ),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Text(
                          'ر.س',
                          style: context.bodySmall,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          itemController.newBill.value?.clearPrice.toString() ??
                              '0',
                          style: context.titleMedium,
                        ),
                        const Spacer(),
                        Text(
                          'صافي الفاتورة',
                          style: context.titleMedium,
                        ),
                      ],
                    ),
                  )),
              const DividerWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'بيانات الدفع',
                      style: context.bodyLarge,
                    ),
                  ),
                ],
              ),
              context.g12,
              const TypeOfPaidWidget(),
              const DividerWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'ملاحضة',
                      style: context.titleMedium,
                    ),
                    context.g8,
                    CustomTextFieldWidget(
                      hint: itemController.billNote.text,
                      controller: itemController.billNote,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      child: CancelBtnWidget(
                        action: () {},
                        label: 'الغاء الفاتورة',
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: ElevatedButtonExtension.primary(
                      label: 'حفظ',
                      onPressed: () {},
                    )),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CompleteSellingBillSummaryItemWidget extends StatelessWidget {
  const CompleteSellingBillSummaryItemWidget({
    super.key,
    required this.label,
    required this.value,
  });
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            'ر.س',
            style: context.bodySmall,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            value,
            style: context.titleMedium,
          ),
          const Spacer(),
          Text(
            label,
            style: context.bodyLarge,
          ),
        ],
      ),
    );
  }
}

class CancelBtnWidget extends StatelessWidget {
  const CancelBtnWidget({
    super.key,
    required this.action,
    required this.label,
  });
  final String label;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Get.to(() => const CompleteSellingBillScreen());
      },
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.red.withOpacity(0.1),
        ),
        child: Center(
          child: Text(
            label,
            style: context.titleMedium?.copyWith(
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}

class TypeOfPaidWidget extends StatelessWidget {
  const TypeOfPaidWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 10,
              ),
              Row(
                children: [
                  Text(
                    'اجل',
                    style: context.bodySmall
                        ?.copyWith(color: context.primaryColor),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    color: context.primaryColor,
                    size: 20,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'نقداً',
                    style: context.bodySmall,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  FaIcon(
                    FontAwesomeIcons.circle,
                    color: context.secondaryTextColor,
                    size: 20,
                  ),
                ],
              ),
              Text(
                'نوع السداد',
                style: context.titleMedium,
              )
            ],
          ),
          // const SizedBox(
          //   height: 20,
          // ),
          // const Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     LightBorderRowWidget(
          //       label: 'الاستحقاق',
          //       value: '2020-05-02',
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Divider(
        color: context.secondaryTextColor.withOpacity(0.2),
      ),
    );
  }
}
