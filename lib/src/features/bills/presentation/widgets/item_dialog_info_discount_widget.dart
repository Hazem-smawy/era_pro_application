import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/utils/perecent_caculator.dart';
import 'package:era_pro_application/src/core/widgets/custom_text_field_with_label_widget.dart';
import 'package:era_pro_application/src/features/bills/presentation/getX/item_controller.dart';
import 'package:era_pro_application/src/features/bills/presentation/widgets/free_quantity_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../domain/entities/bill_ui_entity.dart';

class ItemDialogInfoDiscountWidget extends StatelessWidget {
  ItemDialogInfoDiscountWidget({
    super.key,
    required this.item,
  });

  final ItemController itemController = Get.find();
  final ItemUI item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        DiscountWidget(
          item: item,
        ),
        context.g8,
        FreeQuantityWidget(item: item, itemController: itemController),
      ],
    );
  }
}

class DiscountWidget extends StatelessWidget {
  DiscountWidget({
    super.key,
    required this.item,
  });

  final ItemController itemController = Get.find();
  final ItemUI item;
  final isDiscountError = false.obs;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: item.selectedUnit.preDiscount > 0
          ? Obx(
              () => Column(
                children: [
                  context.g4,
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          child: CustomTextFieldWithLabelWidget(
                            isError: isDiscountError.value,
                            customValidation: (p0) {
                              double res = double.parse(p0);

                              double percent = rateToPercent(
                                  res, item.selectedUnit.totalPrice);
                              if (percent > item.selectedUnit.preDiscount) {
                                isDiscountError.value = true;
                                return 'it is not valid';
                              } else {
                                return null;
                              }
                            },
                            enabled: item.selectedUnit.totalPrice != 0,
                            controller:
                                itemController.discountRateTextEditing.value,
                            textHint: '0.0',
                            label: 'مبلغ',
                            action: (p0) {
                              isDiscountError.value = false;

                              var updatedItem = itemController.items.firstWhere(
                                  (element) => element.id == item.id);
                              if (p0.isNotEmpty) {
                                updatedItem.selectedUnit.discount =
                                    double.parse(p0);
                              } else {
                                updatedItem.selectedUnit.discount = 0;
                              }
                              itemController
                                      .discountPercentTextEditing.value.text =
                                  formatDiscountPercentage(
                                      updatedItem.selectedUnit.discount,
                                      updatedItem.selectedUnit.totalPrice);

                              updatedItem.selectedUnit.discountPercent =
                                  rateToPercent(
                                      updatedItem.selectedUnit.discount,
                                      updatedItem.selectedUnit.totalPrice);
                              if (updatedItem.selectedUnit.discount == 0) {
                                itemController.clearTextEditingController(
                                    isDiscount: true);
                              }

                              itemController.refreshItemCardInfo(updatedItem);
                            },
                          ),
                        ),
                      ),
                      context.g8,
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          child: CustomTextFieldWithLabelWidget(
                            isError: isDiscountError.value,
                            customValidation: (p0) {
                              double percent = double.parse(p0);

                              if (percent > item.selectedUnit.preDiscount) {
                                isDiscountError.value = true;
                                return 'it is not valid';
                              } else {
                                return null;
                              }
                            },
                            enabled: itemController.items
                                    .firstWhere((e) => e.id == item.id)
                                    .selectedUnit
                                    .totalPrice !=
                                0,
                            controller:
                                itemController.discountPercentTextEditing.value,
                            textHint: '0.0%',
                            label: 'نسبة %',
                            action: (p0) {
                              var updatedItem = itemController.items.firstWhere(
                                  (element) => element.id == item.id);
                              var percent = 0.0;
                              if (p0.isNotEmpty) {
                                percent = double.parse(p0);
                              } else {
                                percent = 0;
                              }
                              isDiscountError.value = false;

                              updatedItem.selectedUnit.discount =
                                  (updatedItem.selectedUnit.totalPrice *
                                          percent) /
                                      100;
                              updatedItem.selectedUnit.discountPercent =
                                  percent;
                              itemController
                                      .discountRateTextEditing.value.text =
                                  updatedItem.selectedUnit.discount.toString();
                              itemController.refreshItemCardInfo(updatedItem);
                              if (percent == 0) {
                                itemController.clearTextEditingController(
                                    isDiscount: true);
                              }
                            },
                          ),
                        ),
                      ),
                      context.g8,
                      Container(
                        width: 40,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: context.secondaryTextColor.withOpacity(0.1),
                          ),
                        ),
                        child: Center(
                          child: FittedBox(
                            child: Text(
                              '${item.selectedUnit.preDiscount}%',
                              style: context.bodySmall,
                            ),
                          ),
                        ),
                      ),
                      context.g20,
                      Text(
                        'الخصم',
                        style: context.titleSmall,
                      ),
                    ],
                  ),
                  context.g4,
                ],
              ),
            )
          : const SizedBox(),
    );
  }
}
