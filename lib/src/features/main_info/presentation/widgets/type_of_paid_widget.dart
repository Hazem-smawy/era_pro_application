// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/features/main_info/domain/entities/main_info_entity.dart';
import 'package:era_pro_application/src/features/main_info/presentation/getX/main_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class TypeOfPaidWidget extends StatelessWidget {
  MainInfoController mainInfoController = Get.find();
  TypeOfPaidWidget({
    super.key,
  });

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
                GestureDetector(
                  onTap: () {
                    mainInfoController.paymentType.value = false;
                    mainInfoController.changePaymentMethod(mainInfoController
                        .allPaymentsMethod.value
                        .firstWhereOrNull((e) => e.id == 1));
                  },
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
                          '')
                        const Spacer(),
                      if (mainInfoController
                              .selectedPaymentsMethodDetails.value !=
                          '')
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
                            child: DropdownButton<String>(
                              elevation: 1,
                              isDense: true,
                              isExpanded: true,
                              borderRadius: BorderRadius.circular(10),
                              items: mainInfoController.paymentsMethodDetails
                                  .map((value) {
                                return DropdownMenuItem<String>(
                                  alignment: AlignmentDirectional.center,
                                  value: value,
                                  child: FittedBox(
                                    child: Text(
                                      value,
                                      style: context.titleMedium,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                mainInfoController.selectedPaymentsMethodDetails
                                    .value = value ?? '';
                              },
                              hint: Text(
                                mainInfoController
                                    .selectedPaymentsMethodDetails.value,
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
                        //  DropdownButton<PaymentEntity>(
                        //   elevation: 1,
                        //   isExpanded: true,
                        //   borderRadius: BorderRadius.circular(10),
                        //   items: mainInfoController.allPaymentsMethod.value
                        //       // .where((value) => value.id != 0)
                        //       .map((value) {

                        //     return DropdownMenuItem<PaymentEntity>(
                        //       alignment: AlignmentDirectional.center,
                        //       value: value,
                        //       child: Text(
                        //         value.methodName,
                        //         style: context.titleMedium,
                        //       ),
                        //     );
                        //   }).toList(),
                        //   onChanged: (value) {
                        //     final newValue = value ??
                        //         mainInfoController
                        //             .allPaymentsMethod.value.first;
                        //     mainInfoController.selectedPaymentsMethod.value =
                        //         newValue;
                        //     final newPaymentMethodDetials = mainInfoController
                        //         .allAccount.value
                        //         .where((e) => e.accCatagory == newValue.id)
                        //         .map((e) => e.accName)
                        //         .toList();

                        //     if (newPaymentMethodDetials.isNotEmpty) {
                        //       mainInfoController.paymentsMethodDetails.value =
                        //           newPaymentMethodDetials;
                        //       mainInfoController
                        //               .selectedPaymentsMethodDetails.value =
                        //           mainInfoController
                        //               .paymentsMethodDetails.first;
                        //     } else {
                        //       mainInfoController
                        //           .selectedPaymentsMethodDetails.value = '';
                        //     }
                        //   },
                        //   hint: Text(
                        //     mainInfoController
                        //             .selectedPaymentsMethod.value?.methodName ??
                        //         '',
                        //     style: context.titleMedium,
                        //   ),
                        //   value:
                        //       mainInfoController.selectedPaymentsMethod.value,
                        //   underline: const SizedBox(),
                        //   icon: Padding(
                        //     padding: const EdgeInsets.only(right: 10),
                        //     child: FaIcon(
                        //       FontAwesomeIcons.chevronDown,
                        //       size: 15,
                        //       color: context.secondaryTextColor,
                        //     ),
                        //   ),
                        //   alignment: AlignmentDirectional.center,
                        // ),
                      ),
                    ],
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
