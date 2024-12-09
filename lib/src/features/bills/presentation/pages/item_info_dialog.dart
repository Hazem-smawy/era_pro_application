import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/padding_extension.dart';
import 'package:era_pro_application/src/features/bills/presentation/getX/item_controller.dart';
import 'package:era_pro_application/src/features/bills/presentation/widgets/item_dialog_info_discount_widget.dart';
import 'package:era_pro_application/src/features/bills/presentation/widgets/item_dialog_info_name_and_unit_widget.dart';
import 'package:era_pro_application/src/features/bills/presentation/widgets/item_dialog_info_price_and_total_units_widget.dart';
import 'package:era_pro_application/src/features/bills/presentation/widgets/item_info_dialog_tax_and_notes_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entities/bill_ui_entity.dart';

class ItemInfoDialg extends StatelessWidget {
  final ItemUI item;

  ItemInfoDialg({super.key, required this.item});

  final ItemController itemController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 50,
            bottom: 20,
          ),
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: context.backgroundColor,
            ),
            child: Container(
              // resizeToAvoidBottomInset: false,
              color: context.backgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ItemDialogInfoNameAndUnitWidget(
                    item: item,
                  ),
                  context.g4,
                  Divider(
                    color: context.secondaryTextColor.withOpacity(0.1),
                  ),
                  context.g4,
                  ItemDialogInfoPriceAndTotalUnitsWidget(
                    item: item,
                  ),
                  context.g4,
                  if (item.selectedUnit.preDiscount > 0)
                    Divider(
                      color: context.secondaryTextColor.withOpacity(0.1),
                    ),
                  ItemDialogInfoDiscountWidget(item: item),
                  if (item.hasTax)
                    Divider(
                      color: context.secondaryTextColor.withOpacity(0.1),
                    ),
                  context.g4,
                  ItemInfoDialogTaxAndNotesWidget(
                    item: item,
                  ),
                  context.g8,
                  DialogInfoTotalPriceForItemWidget(
                      item: item, itemController: itemController),
                  context.g16,
                  const ItemInfoDialogBtnWidget()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DialogInfoTotalPriceForItemWidget extends StatelessWidget {
  const DialogInfoTotalPriceForItemWidget({
    super.key,
    required this.item,
    required this.itemController,
  });

  final ItemUI item;
  final ItemController itemController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 40,
        child: Row(
          children: [
            FittedBox(
              child: Text(
                item.clearPrice.toString(),
                style: context.titleLarge,
              ),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                // mainAxisAlignment: MainAxisAlignment.end,
                children: itemController.items
                    .firstWhere((e) => e.id == item.id)
                    .unitDetails
                    .map((e) => e.updatedQuantity > 0
                        ? Center(
                            child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.green.withOpacity(0.07),
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    e.name,
                                    style: context.bodySmall.copyWith(
                                      color: Colors.green,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    e.updatedQuantity.toString(),
                                    style: context.bodySmall.copyWith(
                                      color: Colors.green,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                ],
                              ),
                            ),
                          )
                        : const SizedBox())
                    .toList(),
              ).ph(10),
            ),
            Text(
              'الإجمالي',
              style: context.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class ItemInfoDialogBtnWidget extends StatelessWidget {
  const ItemInfoDialogBtnWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              height: 50,
              // margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(7),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: context.primaryColor,
              ),
              child: Center(
                child: Text(
                  'متابعة',
                  style: context.titleMedium.copyWith(
                    color: context.whiteColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
