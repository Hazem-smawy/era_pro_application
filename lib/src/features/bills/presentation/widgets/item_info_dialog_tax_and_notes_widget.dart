import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/widgets/custom_text_field_with_label_widget.dart';
import 'package:era_pro_application/src/features/bills/presentation/getX/bills_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entities/bill_ui_entity.dart';

class ItemInfoDialogTaxAndNotesWidget extends StatelessWidget {
  ItemInfoDialogTaxAndNotesWidget({
    super.key,
    required this.item,
  });
  final Rx<ItemUI> item;
  final ItemController itemController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: CustomTextFieldWithLabelWidget(
                    placeHolder: item.value.taxRate <= 0.0
                        ? null
                        : '${item.value.taxRate}',
                    textHint: '0.0',
                    label: 'مبلغ',
                    action: (p0) {
                      var updatedItem = itemController.items
                          .firstWhere((element) => element.id == item.value.id);
                      if (p0.isNotEmpty) {
                        updatedItem.taxRate = double.parse(p0);

                        updatedItem.totalPriceWithTaxRate = updatedItem.taxRate;
                      } else {
                        updatedItem.taxRate = 0;
                        updatedItem.totalPriceWithDiscountRate = 0;
                      }

                      itemController.refreshItemBillInfo(updatedItem);
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
                    textHint: '${0.0}%',
                    placeHolder: item.value.taxPercent <= 0.0
                        ? null
                        : '${item.value.taxPercent}%',
                    label: 'نسبة',
                    action: (p0) {
                      var updatedItem = itemController.items
                          .firstWhere((element) => element.id == item.value.id);
                      if (p0.isNotEmpty) {
                        updatedItem.taxPercent = double.parse(p0);
                      } else {
                        updatedItem.taxPercent = 0;
                        updatedItem.totalPriceWithTaxPercent = 0;
                      }

                      itemController.refreshItemBillInfo(updatedItem);
                    },
                  ),
                ),
              ),
              context.g28,
              Text(
                'ضريبة الصنف',
                style: context.bodyMeduim,
              ),
            ],
          ),
          context.g12,
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: TextField(
              minLines: 1,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              style: context.bodyLarge,
              onChanged: (value) {
                item.value.note = value;
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: context.wightColor.withOpacity(0.7),
                filled: true,
                hintStyle: context.bodyLarge,
                hintText: 'ملاحطة',
              ),
              maxLines: 3,
            ),
          ),
          context.g12,
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: context.secondaryTextColor.withOpacity(0.2),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Obx(() => Text(
                      itemController.items
                          .firstWhere((e) => e.id == item.value.id)
                          .clearPrice
                          .toString(),
                      style: context.titleLarge,
                    )),
                const Spacer(),
                Text(
                  'إجمالي السعر',
                  style: context.titleSmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
