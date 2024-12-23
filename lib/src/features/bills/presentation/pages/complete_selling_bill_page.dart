// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:era_pro_application/src/core/utils/currency_format.dart';
import 'package:era_pro_application/src/features/accounts/presentation/widgets/search_dropdown_widget.dart';
import 'package:era_pro_application/src/features/bills/domain/entities/bill_ui_entity.dart';
import 'package:era_pro_application/src/features/bills/presentation/getX/bill_controller.dart';
import 'package:era_pro_application/src/features/bills/presentation/widgets/added_tax_and_discount_widget.dart';
import 'package:era_pro_application/src/features/bills/presentation/widgets/complete_selling_bill_summary_item_widget.dart';
import 'package:era_pro_application/src/features/bills/presentation/widgets/divider_widget.dart';
import 'package:era_pro_application/src/features/main_info/presentation/widgets/type_of_paid_widget.dart';
import 'package:flutter/material.dart';
import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/elvated_btn_extension.dart';
import 'package:era_pro_application/src/core/widgets/header_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../core/utils/perecent_caculator.dart';
import '../../../../core/utils/pick_data_method.dart';
import '../../../../core/widgets/custom_text_filed_widget.dart';

class CompleteSellingBillPage extends StatefulWidget {
  final CardUI card;

  const CompleteSellingBillPage({super.key, required this.card});

  @override
  State<CompleteSellingBillPage> createState() =>
      _CompleteSellingBillPageState();
}

class _CompleteSellingBillPageState extends State<CompleteSellingBillPage> {
  BillController billController = Get.find();
  @override
  void initState() {
    super.initState();

    billController.refreshBillTextEditingControllers();

    billController.newBill.value.numberOfItems = widget.card.items.length;
    billController.newBill.value.totalPrice = widget.card.totalPrice;

    billController.newBill.value.tax = widget.card.tax;
    billController.newBill.value.discount = widget.card.discount;

    double? perTax = double.tryParse(billController.billTaxRate.text);
    if (perTax != null) {
      billController.newBill.value.addedTaxPercent = double.parse(rateToPercent(
        perTax,
        billController.newBill.value.netBill,
      ).toStringAsFixed(2));
    }
    // billController.newBill.value.addedTax =
    //     (billController.newBill.value.addedTaxPercent *
    //             (billController.newBill.value.netBill)) /
    //         100;
    billController.newBill.value.addedTax = percentToRate(
        billController.newBill.value.addedTaxPercent,
        billController.newBill.value.netBill);
    billController.billTaxPercent.text =
        billController.newBill.value.addedTaxPercent.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
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
                        color: context.whiteColor,
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
                    const SizedBox(
                      width: 4,
                    ),
                    Expanded(
                        child: SearchDropdownWidget(
                      initialId: billController.newBill.value.customerNumber,
                      action: (p0) {
                        billController.newBill.value.customerNumber =
                            p0?.accNumber ?? 0;
                      },
                    ))
                  ],
                ),
              ),
              const DividerWidget(),
              CompleteSellingBillSummaryItemWidget(
                label: 'الخصم',
                value: billController.newBill.value.discount.toString(),
              ),
              context.g8,
              CompleteSellingBillSummaryItemWidget(
                label: 'الضريبة',
                value: billController.newBill.value.tax.toString(),
              ),
              context.g8,
              CompleteSellingBillSummaryItemWidget(
                isTotal: true,
                label: 'اجمالي الفاتورة',
                value: currencyFormat(
                    number: billController.newBill.value.totalPrice.toString()),
              ),
              const DividerWidget(),
              const AddedTaxAndDiscountWidget(),
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
                          currencyFormat(
                              number: billController.newBill.value.clearPrice
                                  .toString()),
                          style: context.displayMedium.copyWith(
                            // fontWeight: FontWeight.bold,
                            color: context.blackColor,
                          ),
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
              Obx(() => TypeOfPaidWidget(
                    selectedCurencyId:
                        billController.newBill.value.selectedCurencyId,
                    clearPrice: billController.newBill.value.clearPrice,
                    selectedDate: billController.newBill.value.dueDate,
                    selectDateAction: () async {
                      DateTime? dueDate = await pickData(context);
                      billController.newBill.value.dueDate = dueDate;
                      return dueDate;
                    },
                  )),

              const DividerWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomTextFieldWidget(
                      hint: 'ملاحظة',
                      controller: billController.billNoteTextEditingController,
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    // Expanded(
                    //   child: CancelBtnWidget(
                    //     action: () {},
                    //     label: 'الغاء الفاتورة',
                    //   ),
                    // ),
                    // const SizedBox(
                    //   width: 10,
                    // ),
                    Expanded(
                        child: ElevatedButtonExtension.primary(
                      label: 'حفظ',
                      onPressed: () {
                        billController.addNewBill();
                      },
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
