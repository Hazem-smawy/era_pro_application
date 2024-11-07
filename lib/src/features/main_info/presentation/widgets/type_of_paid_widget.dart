// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/utils/pick_data_method.dart';
import 'package:era_pro_application/src/core/widgets/custom_text_filed_widget.dart';
import 'package:era_pro_application/src/features/accounts/domain/entities/account_entity.dart';
import 'package:era_pro_application/src/features/main_info/domain/entities/main_info_entity.dart';
import 'package:era_pro_application/src/features/main_info/presentation/getX/main_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class TypeOfPaidWidget extends StatelessWidget {
  double clearPrice;
  Function() selectDateAction;
  TypeOfPaidWidget(
      {super.key, required this.clearPrice, required this.selectDateAction});

  MainInfoController mainInfoController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    mainInfoController.paymentType.value = true;
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: context.wightColor.withOpacity(0.1),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'اجل',
                          style: context.bodySmall?.copyWith(
                            color: mainInfoController.paymentType.value
                                ? context.primaryColor
                                : context.secondaryTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        FaIcon(
                          mainInfoController.paymentType.value
                              ? FontAwesomeIcons.circleCheck
                              : FontAwesomeIcons.circle,
                          color: mainInfoController.paymentType.value
                              ? context.primaryColor
                              : context.secondaryTextColor,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    mainInfoController.paymentType.value = false;
                    mainInfoController.changePaymentMethod(mainInfoController
                        .allPaymentsMethod.value
                        .firstWhereOrNull((e) => e.id == 1));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: context.wightColor.withOpacity(0.1),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'نقداً',
                          style: context.bodySmall?.copyWith(
                            color: mainInfoController.paymentType.value
                                ? context.secondaryTextColor
                                : context.primaryColor,
                            fontWeight: mainInfoController.paymentType.value
                                ? FontWeight.normal
                                : FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        FaIcon(
                          mainInfoController.paymentType.value
                              ? FontAwesomeIcons.circle
                              : FontAwesomeIcons.circleCheck,
                          color: mainInfoController.paymentType.value
                              ? context.secondaryTextColor
                              : context.primary,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  'نوع السداد',
                  style: context.titleMedium,
                )
              ],
            ),
            if (!mainInfoController.paymentType.value)
              Column(
                children: [
                  context.g16,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (mainInfoController
                              .selectedPaymentsMethodDetails.value ==
                          null)
                        const Spacer(),
                      if (mainInfoController
                              .selectedPaymentsMethodDetails.value !=
                          null)
                        Expanded(
                          child: Container(
                            height: 40,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color:
                                    context.secondaryTextColor.withOpacity(0.5),
                              ),
                            ),
                            child: DropdownButton<AccountEntity>(
                              elevation: 1,
                              isDense: true,
                              isExpanded: true,
                              borderRadius: BorderRadius.circular(10),
                              items: mainInfoController.paymentsMethodDetails
                                  .map((value) {
                                return DropdownMenuItem<AccountEntity>(
                                  alignment: AlignmentDirectional.center,
                                  value: value,
                                  child: FittedBox(
                                    child: Text(
                                      value.accName,
                                      style: context.titleMedium,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                mainInfoController.selectedPaymentsMethodDetails
                                    .value = value;
                              },
                              hint: Text(
                                mainInfoController.selectedPaymentsMethodDetails
                                        .value?.accName ??
                                    '',
                                style: context.titleMedium,
                              ),
                              value: mainInfoController
                                  .selectedPaymentsMethodDetails.value,
                              underline: const SizedBox(),
                              icon: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: FaIcon(
                                  FontAwesomeIcons.chevronDown,
                                  size: 15,
                                  color: context.secondaryTextColor,
                                ),
                              ),
                              alignment: AlignmentDirectional.center,
                            ),
                          ),
                        ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 40,
                        width: Get.width / 2.5,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: context.secondaryTextColor.withOpacity(0.5),
                          ),
                        ),
                        child: mainInfoController
                                .allPaymentsMethod.value.isEmpty
                            ? const SizedBox()
                            : DropdownButton<PaymentEntity>(
                                elevation: 1,
                                isExpanded: true,
                                borderRadius: BorderRadius.circular(10),
                                items: mainInfoController
                                    .allPaymentsMethod.value
                                    .where((value) => value.id != 0)
                                    .map((value) {
                                  return DropdownMenuItem<PaymentEntity>(
                                    alignment: AlignmentDirectional.center,
                                    value: value,
                                    child: Text(
                                      value.methodName,
                                      style: context.titleMedium,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  mainInfoController.changePaymentMethod(value);
                                },
                                hint: Text(
                                  mainInfoController.selectedPaymentsMethod
                                          .value?.methodName ??
                                      '',
                                  style: context.titleMedium,
                                ),
                                value: mainInfoController
                                            .selectedPaymentsMethod.value?.id !=
                                        0
                                    ? mainInfoController
                                        .selectedPaymentsMethod.value
                                    : mainInfoController.allPaymentsMethod.value
                                        .firstWhere(
                                        (method) => method.id != 0,
                                      ),
                                underline: const SizedBox(),
                                icon: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: FaIcon(
                                    FontAwesomeIcons.chevronDown,
                                    size: 15,
                                    color: context.secondaryTextColor,
                                  ),
                                ),
                                alignment: AlignmentDirectional.center,
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            context.g12,
            if (mainInfoController.paymentType.value)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => selectDateAction(),
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: context.secondaryTextColor.withOpacity(0.3),
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'تأريخ الإستحقاق',
                            style: context.bodySmall,
                          ),
                          context.g8,
                          FaIcon(
                            FontAwesomeIcons.calendar,
                            size: 20,
                            color: context.secondaryTextColor,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            if (mainInfoController.paymentType.value == false)
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (mainInfoController
                          .selecteCurency.value!.storeCurrency)
                        const Spacer(),
                      if (!mainInfoController
                          .selecteCurency.value!.storeCurrency)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'الإجمالي في العملة الجديد',
                              style: context.bodySmall,
                            ),
                            context.g8,
                            Text(
                              (clearPrice /
                                      mainInfoController
                                          .selecteCurency.value!.value)
                                  .toStringAsFixed(3),
                              style: context.titleMedium,
                            )
                          ],
                        ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'اختار  العملة',
                            style: context.bodySmall,
                          ),
                          context.g8,
                          Container(
                            height: 40,
                            width: Get.width / 2.5,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color:
                                    context.secondaryTextColor.withOpacity(0.5),
                              ),
                            ),
                            child: DropdownButton<CurencyEntity>(
                              elevation: 1,
                              isDense: true,
                              isExpanded: true,
                              borderRadius: BorderRadius.circular(10),
                              items: mainInfoController.allCurencies.value
                                  .map((value) {
                                return DropdownMenuItem<CurencyEntity>(
                                  alignment: AlignmentDirectional.center,
                                  value: value,
                                  child: FittedBox(
                                    child: Text(
                                      value.name,
                                      style: context.titleMedium,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                mainInfoController.selecteCurency.value = value;
                              },
                              hint: Text(
                                mainInfoController.selecteCurency.value?.name ??
                                    '',
                                style: context.titleMedium,
                              ),
                              value: mainInfoController.selecteCurency.value,
                              underline: const SizedBox(),
                              icon: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: FaIcon(
                                  FontAwesomeIcons.chevronDown,
                                  size: 15,
                                  color: context.secondaryTextColor,
                                ),
                              ),
                              alignment: AlignmentDirectional.center,
                            ),
                          ),
                        ],
                      ),
                      // Text(
                      //   mainInfoController.selecteCurency.value?.value
                      //           .toString() ??
                      //       '',
                      //   style: context.bodyLarge,
                      // ),
                    ],
                  ),
                  context.g12,
                  const Text("ادخل المبلغ المستلم"),
                  context.g8,
                  Obx(
                    () => Row(
                      children: [
                        if (mainInfoController.selectedPaymentsMethodDetails
                                .value?.accCatagory ==
                            2)
                          GestureDetector(
                            onTap: () => selectDateAction(),
                            child: Container(
                              height: 50,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: context.secondaryTextColor
                                      .withOpacity(0.3),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    'تأريخ الإستحقاق',
                                    style: context.bodySmall,
                                  ),
                                  context.g8,
                                  FaIcon(
                                    FontAwesomeIcons.calendar,
                                    size: 20,
                                    color: context.secondaryTextColor,
                                  )
                                ],
                              ),
                            ),
                          ),
                        context.g8,
                        Expanded(
                          child: CustomTextFieldWidget(
                            isNumber: true,
                            hint: "المبلغ",
                            controller: mainInfoController
                                .paymentAmountTextEditingController.value,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
          ],
        ),
      ),
    );
  }
}
