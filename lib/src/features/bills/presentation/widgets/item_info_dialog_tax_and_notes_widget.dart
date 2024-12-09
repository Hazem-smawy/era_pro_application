import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/utils/perecent_caculator.dart';
import 'package:era_pro_application/src/core/widgets/custom_text_field_with_label_widget.dart';
import 'package:era_pro_application/src/features/bills/presentation/getX/item_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entities/bill_ui_entity.dart';

class ItemInfoDialogTaxAndNotesWidget extends StatefulWidget {
  const ItemInfoDialogTaxAndNotesWidget({
    super.key,
    required this.item,
  });
  final ItemUI item;

  @override
  State<ItemInfoDialogTaxAndNotesWidget> createState() =>
      _ItemInfoDialogTaxAndNotesWidgetState();
}

class _ItemInfoDialogTaxAndNotesWidgetState
    extends State<ItemInfoDialogTaxAndNotesWidget> {
  final ItemController itemController = Get.find();
  @override
  void initState() {
    super.initState();
    itemController.refreshTextEditingControllers(widget.item);
    itemController.updatePreTaxForItem(widget.item);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (widget.item.hasTax)
          Obx(
            () => Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: CustomTextFieldWithLabelWidget(
                      enabled: false,
                      controller: itemController.taxRateTextEditing.value,
                      textHint: '0.0',
                      label: 'مبلغ',
                      action: (p0) {
                        var updatedItem = itemController.items.firstWhere(
                            (element) => element.id == widget.item.id);
                        if (p0.isNotEmpty) {
                          updatedItem.selectedUnit.tax = double.parse(p0);
                        } else {
                          updatedItem.selectedUnit.tax = 0;
                        }
                        itemController.taxPercentTextEditing.value.text =
                            formatDiscountPercentage(
                                updatedItem.selectedUnit.tax,
                                updatedItem.selectedUnit.totalPrice);

                        updatedItem.selectedUnit.taxPercent = rateToPercent(
                            updatedItem.selectedUnit.tax,
                            updatedItem.selectedUnit.totalPrice);
                        itemController.refreshItemCardInfo(updatedItem);
                        if (updatedItem.selectedUnit.tax == 0) {
                          itemController.clearTextEditingController(
                              isDiscount: false);
                        }
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
                      enabled: false,
                      textHint: '${0.0}%',
                      controller: itemController.taxPercentTextEditing.value,
                      label: 'نسبة %',
                      action: (p0) {
                        var updatedItem = itemController.items.firstWhere(
                            (element) => element.id == widget.item.id);
                        double percent = 0.0;
                        if (p0.isNotEmpty) {
                          percent = double.parse(p0);
                        } else {
                          percent = 0;
                        }
                        updatedItem.selectedUnit.taxPercent = percent;

                        updatedItem.selectedUnit.tax =
                            (widget.item.selectedUnit.totalPrice * percent) /
                                100;
                        itemController.taxRateTextEditing.value.text =
                            updatedItem.selectedUnit.tax.toString();
                        itemController.refreshItemCardInfo(updatedItem);
                        if (percent == 0) {
                          itemController.clearTextEditingController(
                              isDiscount: false);
                        }
                      },
                    ),
                  ),
                ),
                context.g28,
                Text(
                  'ضريبة الصنف',
                  style: context.bodyMedium,
                ),
              ],
            ),
          ),
        context.g8,
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
              Obx(
                () => Text(
                  itemController.items
                      .firstWhere((e) => e.id == widget.item.id)
                      .selectedUnit
                      .clearPrice
                      .toString(),
                  style: context.titleLarge,
                ),
              ),
              const Spacer(),
              Text(
                'إجمالي السعر',
                style: context.titleSmall,
              ),
            ],
          ),
        ),
        context.g8,
        ClipRRect(
          borderRadius: BorderRadius.circular(2),
          child: SizedBox(
            height: 50,
            child: TextField(
              minLines: 1,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              style: context.bodyLarge,
              onChanged: (value) {
                widget.item.selectedUnit.note = value;
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: context.whiteColor.withOpacity(0.7),
                filled: true,
                hintStyle: context.bodySmall,
                hintText: 'ملاحطة',
              ),
              maxLines: 3,
            ),
          ),
        ),
      ],
    );
  }
}
