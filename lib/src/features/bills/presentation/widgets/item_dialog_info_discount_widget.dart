import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/utils/perecent_caculator.dart';
import 'package:era_pro_application/src/core/widgets/custom_text_field_with_label_widget.dart';
import 'package:era_pro_application/src/features/bills/presentation/getX/bills_controller.dart';
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

  BillController itemController = Get.find();
  ItemUI item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Discount_widget(
          item: item,
        ),
        context.g8,
        FreeQuantityWidget(item: item, itemController: itemController),
      ],
    );
  }
}

class Discount_widget extends StatelessWidget {
  Discount_widget({
    super.key,
    required this.item,
  });

  final BillController itemController = Get.find();
  final ItemUI item;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 40,
              child: CustomTextFieldWithLabelWidget(
                controller: itemController.discountRateTextEditing.value,
                textHint: '0.0',
                label: 'مبلغ',
                action: (p0) {
                  var updatedItem = itemController.items
                      .firstWhere((element) => element.id == item.id);
                  if (p0.isNotEmpty) {
                    updatedItem.selectedUnit.discount = double.parse(p0);
                  } else {
                    updatedItem.selectedUnit.discount = 0;
                  }
                  itemController.discountPercentTextEditing.value.text =
                      formatDiscountPercentage(
                          updatedItem.selectedUnit.discount,
                          updatedItem.selectedUnit.totalPrice);

                  updatedItem.selectedUnit.discountPercent = rateToPercent(
                      updatedItem.selectedUnit.discount,
                      updatedItem.selectedUnit.totalPrice);

                  itemController.refreshItemBillInfo(updatedItem);
                },
              ),
            ),
          ),
          context.g12,
          Expanded(
            child: SizedBox(
              height: 40,
              child: CustomTextFieldWithLabelWidget(
                controller: itemController.discountPercentTextEditing.value,
                textHint: '0.0%',
                label: 'نسبة %',
                action: (p0) {
                  var updatedItem = itemController.items
                      .firstWhere((element) => element.id == item.id);
                  var percent = 0.0;
                  if (p0.isNotEmpty) {
                    percent = double.parse(p0);
                  } else {
                    percent = 0;
                  }

                  updatedItem.selectedUnit.discount =
                      (updatedItem.selectedUnit.totalPrice * percent) / 100;
                  updatedItem.selectedUnit.discountPercent = percent;
                  itemController.discountRateTextEditing.value.text =
                      updatedItem.selectedUnit.discount.toString();
                  itemController.refreshItemBillInfo(updatedItem);
                },
              ),
            ),
          ),
          context.g28,
          Text(
            'الخصم',
            style: context.titleSmall,
          ),
        ],
      ),
    );
  }
}
