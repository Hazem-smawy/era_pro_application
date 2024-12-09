import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/elvated_btn_extension.dart';
import 'package:era_pro_application/src/core/extensions/padding_extension.dart';
import 'package:era_pro_application/src/core/utils/pick_data_method.dart';
import 'package:era_pro_application/src/core/widgets/thin_divider_widget.dart';
import 'package:era_pro_application/src/features/accounts/presentation/widgets/search_dropdown_widget.dart';
import 'package:era_pro_application/src/features/exchange_receipt/domain/entities/exchange_entity.dart';
import 'package:era_pro_application/src/features/exchange_receipt/presentation/getX/exchange_receipt_controller.dart';
import 'package:era_pro_application/src/features/main_info/presentation/getX/main_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as date_formater;

import '../../../../core/widgets/custom_text_filed_widget.dart';
import '../../../accounts/domain/entities/account_entity.dart';
import '../../../accounts/presentation/getX/accounts_controller.dart';
import '../../../main_info/domain/entities/curency_entity.dart';
import '../../../main_info/domain/entities/payment_entity.dart';

class AddNewExhangeSheet extends StatefulWidget {
  final ExchangeEntity? exchange;
  const AddNewExhangeSheet({super.key, this.exchange});

  @override
  State<AddNewExhangeSheet> createState() => _AddNewExhangeSheetState();
}

class _AddNewExhangeSheetState extends State<AddNewExhangeSheet> {
  MainInfoController mainInfoController = Get.find();
  AccountsController accountsController = Get.find();
  ExchangeReceiptController exchangeReceiptController = Get.find();

  @override
  void initState() {
    super.initState();
    initPaymentsMethod();
  }

  Future<void> initPaymentsMethod() async {
    if (widget.exchange == null) {
      await exchangeReceiptController.getLastId(1);
    }

    await mainInfoController.getAllPaymentsMethod();
    // // await mainInfoController.getAllAccounts();
    await mainInfoController.getAllAccounts();
    // await accountsController.getAccountInfo();
    await mainInfoController.getAllCurenciesInfo();

    mainInfoController.selectedPaymentsMethod.value =
        mainInfoController.allPaymentsMethod.value.firstWhere(
      (element) => element.id == 1,
    );
    mainInfoController.changePaymentMethod(
      mainInfoController.selectedPaymentsMethod.value,
    );
    mainInfoController.selecteCurency.value = mainInfoController.localCurency;
    if (widget.exchange != null) {
      exchangeReceiptController.updateExchange(widget.exchange!);
    } else {
      exchangeReceiptController.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        color: context.backgroundColor,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: exchangeReceiptController.formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              context.g20,
              ToggleOptionWidget(
                enable: widget.exchange == null,
                options: const ['سند قبض', 'سند صرف'],
                icons: const [
                  FontAwesomeIcons.arrowTrendDown,
                  FontAwesomeIcons.arrowTrendUp,
                ],
                onOptionSelected: (selectedIndex) {
                  if (selectedIndex == 0) {
                    exchangeReceiptController.updateValue('type', 2);
                    exchangeReceiptController.getLastId(2);
                  } else {
                    exchangeReceiptController.updateValue('type', 1);

                    exchangeReceiptController.getLastId(1);
                  }
                },
                initialIndex: widget.exchange != null
                    ? widget.exchange?.sandType == 2
                        ? 0
                        : 1
                    : 1,
                selectedColor: context.secondary,
                unselectedColor: Colors.grey[300]!,
                selectedTextColor: Colors.white,
                unselectedTextColor: Colors.black,
              ),
              context.g12,
              const ThinDividerWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LightBorderRowWidget(
                      label: 'تاريخ السند',
                      value: date_formater.DateFormat.yMEd()
                          .format(DateTime.now()),
                    ),
                    Obx(
                      () => LightBorderRowWidget(
                        label: 'رقم السند',
                        value:
                            (exchangeReceiptController.lastId.value).toString(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'اسم العميل',
                      style: context.bodyLarge,
                    ),
                    context.g8,
                    SearchDropdownWidget(
                      initialId: widget.exchange != null
                          ? widget.exchange?.sandDetails?.first.accNumber ?? 0
                          : 0,
                      action: (p0) {
                        exchangeReceiptController.updateValue(
                          'name',
                          p0?.accName,
                        );

                        exchangeReceiptController.accNumber = p0?.accNumber;
                      },
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'العملة',
                            style: context.titleSmall,
                          ),
                          context.g8,
                          Obx(
                            () => Container(
                              height: 55,
                              alignment: Alignment.center,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: context.whiteColor,
                              ),
                              child: DropdownButton<CurencyEntity>(
                                isExpanded: true,
                                dropdownColor: context.whiteColor,
                                elevation: 1,
                                borderRadius: BorderRadius.circular(15),
                                items: mainInfoController.allCurencies.value
                                    .map((CurencyEntity value) {
                                  return DropdownMenuItem<CurencyEntity>(
                                    alignment: AlignmentDirectional.center,
                                    value: value,
                                    child: Text(
                                      value.name,
                                      style: context.bodyLarge,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  mainInfoController.selecteCurency.value =
                                      value;
                                },
                                hint: Text(
                                  mainInfoController
                                          .selecteCurency.value?.name ??
                                      '',
                                  style: context.bodyLarge,
                                ),
                                value: mainInfoController.selecteCurency.value,
                                underline: const SizedBox(),
                                icon: FaIcon(
                                  FontAwesomeIcons.chevronDown,
                                  size: 15,
                                  color: context.secondaryTextColor,
                                ),
                                alignment: AlignmentDirectional.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    context.g12,
                    Flexible(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'المبلغ',
                            style: context.bodyLarge,
                          ),
                          context.g8,
                          CustomTextFieldWidget(
                            controller: exchangeReceiptController
                                .moneyTextEditingController,
                            hint: 'المبلغ',
                            isNumber: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'المبلغ مطلوب'; // "Amount is required"
                              }
                              // if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                              //   return 'يجب إدخال أرقام فقط'; // "Only numbers are allowed"
                              // }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              context.g8,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ExchangeCustomTextFiled(
                      controller: exchangeReceiptController
                          .detailsTextEditingController,
                      hint: 'البيان',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'البيان مطلوب';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              context.g12,
              const ThinDividerWidget(),
              Column(
                children: [
                  Obx(
                    () => mainInfoController.allPaymentsMethod.value.isNotEmpty
                        ? AnimatedSwitcher(
                            duration: const Duration(milliseconds: 200),
                            child: _buildCashPayment(context),
                          )
                        : const SizedBox(),
                  ),
                  Obx(
                    () =>
                        mainInfoController.selectedPaymentsMethod.value?.id != 1
                            ? Column(
                                children: [
                                  context.g16,
                                  CustomTextFieldWidget(
                                    controller: exchangeReceiptController
                                        .numberOfSandTextEditingController,
                                    hint: 'رقم الشيك او الحوالة',
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return mainInfoController
                                                    .selectedPaymentsMethod
                                                    .value
                                                    ?.id !=
                                                1
                                            ? '  رقم الشيك او الحوالة مطلوب'
                                            : null;
                                      }
                                      return null;
                                    },
                                  ),
                                  context.g12,
                                  _buildDeferredPayment(context),
                                ],
                              )
                            : const SizedBox(),
                  ),
                ],
              ).ph(20),
              context.g20,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: ElevatedButtonExtension.primary(
                  onPressed: () {
                    exchangeReceiptController.addNewExchange(widget.exchange);
                  },
                  label: 'متابعة',
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeferredPayment(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          date_formater.DateFormat.yMd().format(
            exchangeReceiptController.dueDate.value ?? DateTime.now(),
          ),
          style: context.bodyLarge,
        ),
        const Spacer(),
        GestureDetector(
          onTap: () async {
            exchangeReceiptController.dueDate.value = await pickData(context);
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

  Widget _buildCashPayment(BuildContext context) {
    return Obx(() => Column(
          children: [
            context.g16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (mainInfoController.selectedPaymentsMethodDetails.value ==
                    null)
                  const Spacer(),
                if (mainInfoController.selectedPaymentsMethodDetails.value !=
                    null)
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
                  child: mainInfoController.allPaymentsMethod.value.isNotEmpty
                      ? _buildDropdown<PaymentEntity>(
                          context,
                          mainInfoController.allPaymentsMethod.value
                              .where((value) => value.id != 0)
                              .toList(),
                          mainInfoController.selectedPaymentsMethod.value,
                          (value) =>
                              mainInfoController.changePaymentMethod(value),
                          mainInfoController
                                  .selectedPaymentsMethod.value?.methodName ??
                              '',
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          ],
        ));
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

// ignore_for_file: public_member_api_docs, sort_constructors_first

class LightBorderRowWidget extends StatelessWidget {
  const LightBorderRowWidget({
    super.key,
    required this.label,
    required this.value,
  });
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          value,
          style: context.bodyLarge.copyWith(
            color: context.blackColor,
          ),
        ),
        context.g8,
        const Text(":"),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            label,
            style: context.bodySmall,
          ),
        ),
      ],
    );
  }
}

class ToggleOptionWidget extends StatefulWidget {
  const ToggleOptionWidget(
      {super.key,
      required this.options,
      required this.icons,
      required this.onOptionSelected,
      this.initialIndex = 0,
      this.selectedColor = Colors.blue,
      this.unselectedColor = Colors.grey,
      this.selectedTextColor = Colors.white,
      this.unselectedTextColor = Colors.black,
      required this.enable});

  final List<String> options; // List of text options
  final List<IconData> icons; // Corresponding icons for options
  final int initialIndex; // Default selected index
  final Color selectedColor; // Color for the selected option
  final Color unselectedColor; // Color for unselected options
  final Color selectedTextColor; // Text color for selected option
  final Color unselectedTextColor; // Text color for unselected option
  final ValueChanged<int> onOptionSelected; // Callback for option selection
  final bool enable;
  @override
  State<ToggleOptionWidget> createState() => _ToggleOptionWidgetState();
}

class _ToggleOptionWidgetState extends State<ToggleOptionWidget> {
  int selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.options.length, (index) {
        final isSelected = selectedIndex == index;
        return GestureDetector(
          onTap: () {
            if (widget.enable) {
              setState(() {
                selectedIndex = index;
              });
              widget.onOptionSelected(index);
            }
          },
          child: AnimatedContainer(
            width: Get.width / 2 - 50,
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            margin: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              color: isSelected ? widget.selectedColor : widget.unselectedColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: widget.selectedColor.withOpacity(0.5),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      )
                    ]
                  : [],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              textDirection: TextDirection.rtl,
              children: [
                Icon(
                  widget.icons[index],
                  color: isSelected
                      ? widget.selectedTextColor
                      : widget.unselectedTextColor,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  widget.options[index],
                  style: TextStyle(
                    color: isSelected
                        ? widget.selectedTextColor
                        : widget.unselectedTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
