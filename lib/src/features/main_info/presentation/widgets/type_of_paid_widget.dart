import 'dart:async';
import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/widgets/custom_text_filed_widget.dart';
import 'package:era_pro_application/src/features/accounts/domain/entities/account_entity.dart';
import 'package:era_pro_application/src/features/main_info/domain/entities/main_info_entity.dart';
import 'package:era_pro_application/src/features/main_info/presentation/getX/main_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TypeOfPaidWidget extends StatefulWidget {
  final double clearPrice;
  final Future<DateTime?> Function() selectDateAction;
  final int? selectedCurencyId;
  final DateTime? selectedDate;

  const TypeOfPaidWidget({
    super.key,
    required this.clearPrice,
    required this.selectDateAction,
    this.selectedDate,
    this.selectedCurencyId,
  });

  @override
  // ignore: library_private_types_in_public_api
  _TypeOfPaidWidgetState createState() => _TypeOfPaidWidgetState();
}

class _TypeOfPaidWidgetState extends State<TypeOfPaidWidget> {
  late MainInfoController mainInfoController = Get.find();
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.selectedDate ?? DateTime.now();
    mainInfoController.selecteCurency.value = widget.selectedCurencyId == null
        ? mainInfoController.storCurency
        : mainInfoController.allCurencies.value.firstWhere(
            (curency) => curency.id == widget.selectedCurencyId,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            _buildPaymentTypeSelection(context),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: !mainInfoController.paymentType.value
                  ? _buildCashPayment(context)
                  : const SizedBox(),
            ),
            context.g12,
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: mainInfoController.paymentType.value
                  ? _buildDeferredPayment(context)
                  : const SizedBox(),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: mainInfoController.paymentType.value == false
                  ? _buildCurrencySelection(context)
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentTypeSelection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: 10),
        _buildPaymentTypeButton(
          context,
          'اجل',
          mainInfoController.paymentType.value,
          () => mainInfoController.paymentType.value = true,
        ),
        _buildPaymentTypeButton(
          context,
          'نقداً',
          !mainInfoController.paymentType.value,
          () {
            mainInfoController.paymentType.value = false;
            mainInfoController.changePaymentMethod(
              mainInfoController.allPaymentsMethod.value
                  .firstWhereOrNull((e) => e.id == 1),
            );
          },
        ),
        Text(
          'نوع السداد',
          style: context.titleMedium,
        ),
      ],
    );
  }

  Widget _buildPaymentTypeButton(
      BuildContext context, String label, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: context.whiteColor.withOpacity(0.1),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: context.bodySmall.copyWith(
                color: isSelected
                    ? context.primaryColor
                    : context.secondaryTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10),
            FaIcon(
              isSelected
                  ? FontAwesomeIcons.circleCheck
                  : FontAwesomeIcons.circle,
              color: isSelected
                  ? context.primaryColor
                  : context.secondaryTextColor,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCashPayment(BuildContext context) {
    print(mainInfoController.selectedPaymentsMethod.value);
    print(mainInfoController.selectedPaymentsMethodDetails.value);
    return Column(
      children: [
        context.g16,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (mainInfoController.selectedPaymentsMethodDetails.value == null)
              const Spacer(),
            if (mainInfoController.selectedPaymentsMethodDetails.value != null)
              Expanded(
                child: Container(
                  height: 40,
                  width: Get.width / 2.5,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: context.secondaryTextColor.withOpacity(0.2),
                    ),
                  ),
                  child: _buildDropdown<AccountEntity>(
                    context,
                    mainInfoController.paymentsMethodDetails.value
                        as List<AccountEntity>,
                    mainInfoController.selectedPaymentsMethodDetails.value,
                    (value) => mainInfoController
                        .selectedPaymentsMethodDetails.value = value,
                    mainInfoController
                            .selectedPaymentsMethodDetails.value?.accName ??
                        '',
                  ),
                ),
              ),
            const SizedBox(width: 10),
            Container(
              height: 40,
              width: Get.width / 2.5,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: context.secondaryTextColor.withOpacity(0.2),
                ),
              ),
              child: _buildDropdown<PaymentEntity>(
                context,
                mainInfoController.allPaymentsMethod.value
                    .where((value) => value.id != 0)
                    .toList(),
                mainInfoController.selectedPaymentsMethod.value,
                (value) => mainInfoController.changePaymentMethod(value),
                mainInfoController.selectedPaymentsMethod.value?.methodName ??
                    '',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDeferredPayment(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          DateFormat.yMd().format(selectedDate ?? DateTime.now()),
          style: context.bodyLarge,
        ),
        const Spacer(),
        GestureDetector(
          onTap: () async {
            selectedDate = await widget.selectDateAction();
            setState(() {});
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Text(
                  'تأريخ الإستحقاق',
                  style: context.bodySmall.copyWith(color: context.primary),
                ),
                context.g8,
                FaIcon(
                  FontAwesomeIcons.calendar,
                  size: 20,
                  color: context.primary,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCurrencySelection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (mainInfoController.selecteCurency.value!.storeCurrency)
              const Spacer(),
            if (!mainInfoController.selecteCurency.value!.storeCurrency)
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'الإجمالي في العملة الجديد',
                    style: context.bodySmall,
                  ),
                  context.g8,
                  Text(
                    (widget.clearPrice /
                            mainInfoController.selecteCurency.value!.value)
                        .toStringAsFixed(3),
                    style: context.titleMedium,
                  ),
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
                      color: context.secondaryTextColor.withOpacity(0.2),
                    ),
                  ),
                  child: _buildDropdown<CurencyEntity>(
                    context,
                    mainInfoController.allCurencies.value,
                    mainInfoController.selecteCurency.value,
                    (value) => mainInfoController.selecteCurency.value = value,
                    mainInfoController.selecteCurency.value?.name ?? '',
                  ),
                ),
              ],
            ),
          ],
        ),
        context.g12,
        // const Text("ادخل المبلغ المستلم"),
        // context.g8,
        Obx(
          () => Row(
            children: [
              if (mainInfoController
                      .selectedPaymentsMethodDetails.value?.accCatagory ==
                  2)
                GestureDetector(
                  onTap: () => widget.selectDateAction(),
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
                        ),
                      ],
                    ),
                  ),
                ),
              // context.g8,
              // Expanded(
              //   child: CustomTextFieldWidget(
              //     isNumber: true,
              //     hint: "المبلغ",
              //     controller: mainInfoController
              //         .paymentAmountTextEditingController.value,
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown<T>(
    BuildContext context,
    List<T> items,
    T? selectedValue,
    Function(T?) onChanged,
    String hint,
  ) {
    return DropdownButton<T>(
      elevation: 1,
      isDense: true,
      isExpanded: true,
      borderRadius: BorderRadius.circular(10),
      items: items.map((value) {
        return DropdownMenuItem<T>(
          alignment: AlignmentDirectional.center,
          value: value,
          child: FittedBox(
            child: Text(
              value is AccountEntity
                  ? (value as AccountEntity).accName
                  : value is PaymentEntity
                      ? (value as PaymentEntity).methodName
                      : value is CurencyEntity
                          ? (value as CurencyEntity).name
                          : '',
              style: context.bodyLarge,
            ),
          ),
        );
      }).toList(),
      onChanged: onChanged,
      hint: Text(
        hint,
        style: context.bodyLarge,
      ),
      value: selectedValue,
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
    );
  }
}
