import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/widgets/custom_text_field_with_label_widget.dart';
import 'package:era_pro_application/src/features/bills/presentation/getX/bills_controller.dart';
import 'package:era_pro_application/src/features/bills/presentation/widgets/free_quantity_widget.dart';
import 'package:era_pro_application/src/features/bills/presentation/widgets/item_info_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entities/bill_ui_entity.dart';

class ItemDialogInfoDiscountWidget extends StatelessWidget {
  ItemDialogInfoDiscountWidget({
    super.key,
    required this.item,
  });

  ItemController itemController = Get.find();
  ItemUI item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 40,
                child: CustomTextFieldWithLabelWidget(
                  placeHolder:
                      item.discountRate <= 0.0 ? null : '${item.discountRate}',
                  textHint: '0.0',
                  label: 'مبلغ',
                  action: (p0) {
                    var updatedItem = itemController.items
                        .firstWhere((element) => element.id == item.id);
                    if (p0.isNotEmpty) {
                      updatedItem.discountRate = double.parse(p0);
                    } else {
                      updatedItem.discountRate = 0;
                      updatedItem.totalPriceWithDiscountRate = 0;
                    }
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
                  placeHolder: item.discountPercent <= 0.0
                      ? null
                      : '${item.discountPercent}%',
                  textHint: '0.0%',
                  label: 'نسبة',
                  action: (p0) {
                    var updatedItem = itemController.items
                        .firstWhere((element) => element.id == item.id);
                    if (p0.isNotEmpty) {
                      updatedItem.discountPercent = double.parse(p0);
                    } else {
                      updatedItem.discountPercent = 0;
                    }

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
        context.g8,
        Text(
          'الكمية المجانية',
          style: context.bodySmall,
        ),
        context.g4,
        FreeQuantityWidget(item: item, itemController: itemController),
      ],
    );
  }
}
