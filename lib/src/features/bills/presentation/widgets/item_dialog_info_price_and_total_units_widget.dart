import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/padding_extension.dart';
import 'package:era_pro_application/src/features/bills/presentation/getX/bills_controller.dart';
import 'package:era_pro_application/src/features/bills/presentation/widgets/counter_item_widget.dart';
import 'package:era_pro_application/src/features/bills/presentation/widgets/price_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../domain/entities/bill_ui_entity.dart';

class ItemDialogInfoPriceAndTotalUnitsWidget extends StatelessWidget {
  ItemDialogInfoPriceAndTotalUnitsWidget({super.key, required this.item});
  final sellingPriceController = TextEditingController();
  final totalPriceController = TextEditingController();
  final ItemUI item;
  ItemController itemController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      totalPriceController.text = item.selectedUnit.totalPrice.toString();
      // sellingPriceController.text =
      //     itemController.items[index].unitDetails[0].selectedPrice.toString();

      var selectedPrice = item.selectedUnit.selectedPrice;
      sellingPriceController.text = (selectedPrice % 1 == 0)
          ? selectedPrice.toInt().toString()
          : selectedPrice.toString();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              //     Expanded(
              //       child: SizedBox(
              //         width: Get.width / 3,
              //         height: 40,
              //         child: CustomTextFieldWithLabelWidget(
              //             textHint: itemController.items
              //                 .firstWhere((e) => e.id == item.id)
              //                 .unitDetails[0]
              //                 .selectedPrice
              //                 .toString(),
              //             controller: sellingPriceController,
              //             label: 'مبلغ',
              //             isLabeled: false,
              //             action: (p0) {
              //               // sellingPriceController.text = p0;
              //               if (p0.trim().isNotEmpty) {
              //                 Item updatedItem = item;
              //                 updatedItem.selectedUnit.selectedPrice =
              //                     double.parse(p0);
              //                 itemController.refreshItemBillInfo(updatedItem);
              //               }
              //             }),
              //       ),
              //     ),
              Expanded(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: context.wightColor,
                  ),
                  child: Center(
                    child: FittedBox(
                      child: Text(
                        itemController.items
                            .firstWhere((e) => e.id == item.id)
                            .unitDetails[0]
                            .selectedPrice
                            .toString(),
                        style: context.titleMedium,
                      ),
                    ),
                  ),
                ),
              ),
              context.g12,
              PriceDialogWidget(
                isSelected: item.selectedUnit.selectedPrice ==
                    item.selectedUnit.thirdPrice,
                number: 3,
                action: () {
                  itemController.updateSelectedPrice(
                      item.id, item.selectedUnit.id, 3);
                },
              ),
              context.g8,
              PriceDialogWidget(
                isSelected: item.selectedUnit.selectedPrice ==
                    item.selectedUnit.secondPrice,
                number: 2,
                action: () {
                  itemController.updateSelectedPrice(
                    item.id,
                    item.selectedUnit.id,
                    2,
                  );
                },
              ),
              context.g8,
              PriceDialogWidget(
                number: 1,
                isSelected: item.selectedUnit.selectedPrice ==
                    item.selectedUnit.firstPrice,
                action: () {
                  itemController.updateSelectedPrice(
                    item.id,
                    item.selectedUnit.id,
                    1,
                  );
                },
              ),
              context.g8,
              Text(
                'سعر البيع',
                style: context.bodyMeduim,
              ),
            ],
          ),
          context.g12,

          // Text(
          //   'الكمية',
          //   style: context.bodySmall,
          // ),
          // const SizedBox(
          //   height: 10,
          // ),
          Row(
            children: [
              // Expanded(
              //   child: SizedBox(
              //     height: 40,
              //     child: CustomTextFieldWithLabelWidget(
              //         controller: totalPriceController,
              //         textHint: (item.selectedUnit.totalPrice).toString(),
              //         label: 'مبلغ',
              //         isLabeled: false,
              //         action: (p0) {
              //           // if (p0.isNotEmpty && p0 != '') {
              //           //   totalPriceController.text = p0;
              //           // }
              //         }),
              //   ),
              // ),
              Expanded(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: context.wightColor,
                  ),
                  child: Center(
                    child: FittedBox(
                      child: Text(
                        item.selectedUnit.totalPrice.toString(),
                        style: context.titleMedium,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                width: 12,
              ),
              Text(
                'إجمالي المبلغ',
                style: context.bodySmall,
              ),
              const SizedBox(
                width: 8,
              ),
              CounterItemWidget(
                icon: FontAwesomeIcons.minus,
                action: () {
                  if (item.selectedUnit.updatedQuantity > 0) {
                    itemController.updateQuantity(item.id, -1, 0);
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  item.selectedUnit.updatedQuantity.toString(),
                  style: context.titleMedium,
                ),
              ),

              CounterItemWidget(
                icon: FontAwesomeIcons.plus,
                action: () {
                  itemController.updateQuantity(item.id, 1, 0);
                },
              ),
              //
              //
            ],
          ),
          context.g8,
          Obx(
            () => SizedBox(
              height: 40,
              child: Row(
                children: [
                  FittedBox(
                    child: Text(
                      item.totalPriceBeforeDiscountAndTax.toString(),
                      style: context.titleLarge,
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      // mainAxisAlignment: MainAxisAlignment.end,
                      children: item.unitDetails
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
                                          style: context.bodySmall?.copyWith(
                                            color: Colors.green,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          e.updatedQuantity.toString(),
                                          style: context.bodySmall?.copyWith(
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
          ),
        ],
      );
    });
  }
}
