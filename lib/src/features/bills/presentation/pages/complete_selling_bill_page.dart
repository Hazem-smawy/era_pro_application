// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:era_pro_application/src/features/bills/presentation/widgets/cancel_btn_widget.dart';
import 'package:era_pro_application/src/features/bills/presentation/widgets/complete_selling_bill_summary_item_widget.dart';
import 'package:era_pro_application/src/features/bills/presentation/widgets/divider_widget.dart';
import 'package:era_pro_application/src/features/bills/presentation/widgets/search_dropdown.dart';
import 'package:era_pro_application/src/features/main_info/presentation/widgets/type_of_paid_widget.dart';
import 'package:flutter/material.dart';
import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/elvated_btn_extension.dart';
import 'package:era_pro_application/src/core/widgets/custom_text_field_with_label_widget.dart';
import 'package:era_pro_application/src/core/widgets/header_widget.dart';
import 'package:era_pro_application/src/features/bills/presentation/getX/bills_getx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/custom_text_filed_widget.dart';
import '../../../accounts/presentation/pages/add_new_customer_sheet.dart';

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
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
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
                      width: 4,
                    ),
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
                          color: context.wightColor,
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
                    const SizedBox(
                      width: 4,
                    ),
                    Expanded(child: SearchDropdownWidget())
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
              const DividerWidget(),
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
              context.g12,
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
                              itemController.newBill.value?.addTaxRate =
                                  double.parse(p0);
                            } else {
                              itemController.newBill.value?.addTaxRate = 0;
                            }
                            itemController.updateBill();
                          },
                        ),
                      ),
                    ),
                    context.g12,
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
                      width: 16,
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
                        horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
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
              // const DividerWidget(),
              context.g12,
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
              TypeOfPaidWidget(),
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


//1 box
//2 bank
//3 customer
//10 salesman
//6 store
//11 saraf
