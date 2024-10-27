import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/padding_extension.dart';
import 'package:era_pro_application/src/core/widgets/custom_text_field_with_label_widget.dart';
import 'package:era_pro_application/src/features/bills/presentation/getX/bills_controller.dart';
import 'package:era_pro_application/src/features/bills/presentation/getX/bills_getx.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ItemInfoDialg extends StatefulWidget {
  final Rx<Item> item;

  const ItemInfoDialg({super.key, required this.item});

  @override
  State<ItemInfoDialg> createState() => _ItemInfoDialgState();
}

class _ItemInfoDialgState extends State<ItemInfoDialg> {
  ItemController itemController = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    itemController.itemDetailsPriceController.text =
        widget.item.value.unitDetails[0].selectedPrice.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 50,
            bottom: 20,
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: context.bg,
            ),
            child: Container(
              // resizeToAvoidBottomInset: false,
              color: context.bg,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ItemDetailsNameAndUnitWidget(
                    item: widget.item.value,
                  ),
                  context.g4,
                  Divider(
                    color: context.secondaryTextColor.withOpacity(0.1),
                  ),
                  context.g4,
                  ItemDetailsPriceAndTotalUnitsWidget(
                    item: widget.item.value,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Divider(
                    color: context.secondaryTextColor.withOpacity(0.1),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ItemDetailsDiscountWidget(item: widget.item.value),
                  const SizedBox(
                    height: 5,
                  ),
                  Divider(
                    color: context.secondaryTextColor.withOpacity(0.1),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ItemDetailsTaxAndNotesWidget(
                    item: widget.item,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const ItemDetailsBtnsWidget()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ItemDetailsBtnsWidget extends StatelessWidget {
  const ItemDetailsBtnsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Expanded(
        //   child: GestureDetector(
        //     onTap: () {
        //       Get.back();
        //     },
        //     child: Container(
        //       //margin: const EdgeInsets.symmetric(horizontal: 20),
        //       height: 50,
        //       padding: const EdgeInsets.all(7),

        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(25),
        //         color: Colors.red.withOpacity(0.1),
        //       ),
        //       child: Center(
        //         child: Text(
        //           'الغاء',
        //           style: context.titleSmall?.copyWith(
        //             color: Colors.red,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        // context.g12,
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
                  style: context.titleMedium?.copyWith(
                    color: context.wightColor,
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

class ItemDetailsTaxAndNotesWidget extends StatelessWidget {
  ItemDetailsTaxAndNotesWidget({
    super.key,
    required this.item,
  });
  final Rx<Item> item;
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
          Text(
            'ملاحظة',
            style: context.bodyLarge,
          ),
          const SizedBox(
            height: 10,
          ),
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
                // hintText: 'ملاحطة',
              ),
              maxLines: 3,
            ),
          ),
          context.g16,
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
                Text(
                  'ر.س',
                  style: context.bodySmall,
                ),
                const SizedBox(
                  width: 5,
                ),
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

class ItemDetailsDiscountWidget extends StatelessWidget {
  ItemDetailsDiscountWidget({
    super.key,
    required this.item,
  });

  ItemController itemController = Get.find();
  Item item;

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

// class FreeQuantityWidget extends StatefulWidget {
//   const FreeQuantityWidget({
//     super.key,
//     required this.item,
//     required this.itemController,
//   });

//   final Item item;
//   final ItemController itemController;

//   @override
//   State<FreeQuantityWidget> createState() => _FreeQuantityWidgetState();
// }

// class _FreeQuantityWidgetState extends State<FreeQuantityWidget> {
//   ItemController itemController = Get.find();

//   int? remainingQuantity = 0;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     itemController.selectedFreeUnitDetails.value = widget.item.unitDetails
//         .firstWhere((e) => e.id == widget.item.freeUnitId);
//     remainingQuantity =
//         itemController.selectedFreeUnitDetails.value?.quantityRemaining;
//   }

//   UnitDetails getUnitDetailsInfo([int? freeQuantity]) {
//     var unitDetails = itemController.items
//         .firstWhere((e) => e.id == widget.item.id)
//         .unitDetails
//         .firstWhere((e) => e.id == widget.item.freeUnitId);

//     if (freeQuantity != null) {
//       itemController.items
//           .firstWhere((e) => e.id == widget.item.id)
//           .unitDetails
//           .firstWhere((e) => e.id == widget.item.freeUnitId)
//           .freeQuantity += freeQuantity;
//     }

//     return unitDetails;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => Row(
//         children: [
//           Container(
//             width: 40,
//             height: 40,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               border: Border.all(
//                 color: context.secondaryTextColor.withOpacity(0.2),
//               ),
//             ),
//             child: Center(
//               child: Text(
//                 getUnitDetailsInfo().remaningQuantityInStore.toString(),
//                 style: context.bodyMeduim,
//               ),
//             ),
//           ),
//           context.g12,
//           Expanded(
//             child: Container(
//               height: 40,
//               width: Get.width / 2.5,
//               alignment: Alignment.center,
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 border: Border.all(
//                   color: context.secondaryTextColor.withOpacity(0.5),
//                 ),
//               ),
//               child: DropdownButton<int>(
//                 elevation: 1,
//                 isExpanded: true,
//                 borderRadius: BorderRadius.circular(10),
//                 items: widget.item.unitDetails.map((value) {
//                   return DropdownMenuItem<int>(
//                     alignment: AlignmentDirectional.center,
//                     value: value.id,
//                     child: Text(
//                       value.name,
//                       style: context.titleMedium,
//                     ),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   itemController.selectedFreeUnitDetails.value =
//                       widget.item.unitDetails.firstWhere((e) => e.id == value);
//                   setState(() {});
//                 },
//                 hint: Text(
//                   itemController.selectedFreeUnitDetails.value?.name ?? '',
//                   style: context.titleMedium,
//                 ),
//                 value: itemController.selectedFreeUnitDetails.value?.id,
//                 underline: const SizedBox(),
//                 icon: Padding(
//                   padding: const EdgeInsets.only(right: 10),
//                   child: FaIcon(
//                     FontAwesomeIcons.chevronDown,
//                     size: 15,
//                     color: context.secondaryTextColor,
//                   ),
//                 ),
//                 alignment: AlignmentDirectional.center,
//               ),
//             ),
//           ),
//           context.g36,
//           Container(
//             width: 40,
//             decoration: BoxDecoration(
//               color: context.wightColor,
//               shape: BoxShape.circle,
//             ),
//             child: Center(
//               child: IconButton(
//                 onPressed: () {
//                   setState(() {
//                     if (itemController.selectedFreeUnitDetails.value != null &&
//                         itemController
//                                 .selectedFreeUnitDetails.value!.freeQuantity >
//                             0) {
//                       itemController
//                           .selectedFreeUnitDetails.value?.freeQuantity -= 1;
//                       remainingQuantity = itemController.selectedFreeUnitDetails
//                               .value!.quantityRemaining -
//                           itemController
//                               .selectedFreeUnitDetails.value!.freeQuantity;
//                     }
//                   });
//                 },
//                 icon: Icon(
//                   FontAwesomeIcons.minus,
//                   size: 15,
//                   color: context.secondaryTextColor,
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             child: Text(
//               itemController.selectedFreeUnitDetails.value?.freeQuantity
//                       .toString() ??
//                   '0',
//               style: context.titleMedium,
//             ),
//           ),
//           Container(
//             width: 40,
//             decoration: BoxDecoration(
//               color: context.wightColor,
//               shape: BoxShape.circle,
//             ),
//             child: Center(
//               child: IconButton(
//                 onPressed: () {
//                   // if (itemController.selectedFreeUnitDetails.value != null) {
//                   getUnitDetailsInfo(1);
//                   // }
//                 },
//                 icon: Icon(
//                   FontAwesomeIcons.plus,
//                   size: 15,
//                   color: context.secondaryTextColor,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
class FreeQuantityWidget extends StatefulWidget {
  const FreeQuantityWidget({
    super.key,
    required this.item,
    required this.itemController,
  });

  final Item item;
  final ItemController itemController;

  @override
  State<FreeQuantityWidget> createState() => _FreeQuantityWidgetState();
}

class _FreeQuantityWidgetState extends State<FreeQuantityWidget> {
  ItemController itemController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          // Display remaining quantity in store
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: context.secondaryTextColor.withOpacity(0.2),
              ),
            ),
            child: Center(
              child: Text(
                itemController.items
                    .firstWhere((e) => e.id == widget.item.id)
                    .unitDetails
                    .firstWhere((e) => e.id == widget.item.freeUnitId)
                    .quantityRemaining
                    .toString(),
                style: context.bodyMeduim,
              ),
            ),
          ),
          context.g12,
          Expanded(
            child: Container(
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
              child: DropdownButton<int>(
                elevation: 1,
                isExpanded: true,
                borderRadius: BorderRadius.circular(10),
                items: widget.item.unitDetails.map((value) {
                  return DropdownMenuItem<int>(
                    alignment: AlignmentDirectional.center,
                    value: value.id,
                    child: Text(
                      value.name,
                      style: context.titleMedium,
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  var updatedItem = itemController.items.firstWhere(
                    (element) => element.id == widget.item.id,
                  );
                  updatedItem.freeUnitId = value ?? widget.item.freeUnitId;

                  setState(() {});
                },
                hint: Text(
                  itemController.items
                      .firstWhere((e) => e.id == widget.item.id)
                      .unitDetails
                      .firstWhere((e) => e.id == widget.item.freeUnitId)
                      .name,
                  style: context.titleMedium,
                ),
                value: widget.item.freeUnitId,
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
          context.g36,
          // Minus button to decrement freeQuantity
          Container(
            width: 40,
            decoration: BoxDecoration(
              color: context.wightColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: IconButton(
                onPressed: () {
                  if (itemController.items
                          .firstWhere((e) => e.id == widget.item.id)
                          .unitDetails
                          .firstWhere((e) => e.id == widget.item.freeUnitId)
                          .freeQuantity >
                      0) {
                    itemController.updateQuantity(widget.item.id, 0, -1);
                    setState(() {});
                  }
                },
                icon: Icon(
                  FontAwesomeIcons.minus,
                  size: 15,
                  color: context.secondaryTextColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              itemController.items
                  .firstWhere((e) => e.id == widget.item.id)
                  .unitDetails
                  .firstWhere((e) => e.id == widget.item.freeUnitId)
                  .freeQuantity
                  .toString(),
              style: context.titleMedium,
            ),
          ),
          // Plus button to increment freeQuantity
          Container(
            width: 40,
            decoration: BoxDecoration(
              color: context.wightColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: IconButton(
                onPressed: () {
                  itemController.updateQuantity(widget.item.id, 0, 1);
                  setState(() {});
                },
                icon: Icon(
                  FontAwesomeIcons.plus,
                  size: 15,
                  color: context.secondaryTextColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemDetailsPriceAndTotalUnitsWidget extends StatelessWidget {
  ItemDetailsPriceAndTotalUnitsWidget({super.key, required this.item});
  final sellingPriceController = TextEditingController();
  final totalPriceController = TextEditingController();
  final Item item;
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
              Expanded(
                child: SizedBox(
                  width: Get.width / 3,
                  height: 40,
                  child: CustomTextFieldWithLabelWidget(
                      textHint: itemController.items
                          .firstWhere((e) => e.id == item.id)
                          .unitDetails[0]
                          .selectedPrice
                          .toString(),
                      controller: sellingPriceController,
                      label: 'مبلغ',
                      isLabeled: false,
                      action: (p0) {
                        // sellingPriceController.text = p0;
                        if (p0.trim().isNotEmpty) {
                          Item updatedItem = item;
                          updatedItem.selectedUnit.selectedPrice =
                              double.parse(p0);
                          itemController.refreshItemBillInfo(updatedItem);
                        }
                      }),
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
          const SizedBox(
            height: 15,
          ),
          Text(
            'الكمية',
            style: context.bodySmall,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: CustomTextFieldWithLabelWidget(
                      controller: totalPriceController,
                      textHint: (item.selectedUnit.totalPrice).toString(),
                      label: 'مبلغ',
                      isLabeled: false,
                      action: (p0) {
                        // if (p0.isNotEmpty && p0 != '') {
                        //   totalPriceController.text = p0;
                        // }
                      }),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'إجمالي المبلغ',
                style: context.bodySmall,
              ),
              const SizedBox(
                width: 10,
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
            () => Row(
              children: [
                Text(
                  'ر.س',
                  style: context.bodySmall,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  item.totalPriceBeforeDiscountAndTax.toString(),
                  style: context.titleLarge,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: item.unitDetails
                        .map((e) => e.updatedQuantity > 0
                            ? Container(
                                margin: const EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
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
        ],
      );
    });
  }
}

class ItemDetailsNameAndUnitWidget extends StatelessWidget {
  ItemDetailsNameAndUnitWidget({super.key, required this.item});
  ItemController itemController = Get.find();
  Item item;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          const FaIcon(FontAwesomeIcons.circleInfo),
          context.g12,
          const Spacer(),
          Text(
            item.name,
            style: context.titleMedium,
          ),
        ],
      ),
      context.g12,
      Obx(
        () => Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              constraints: const BoxConstraints(minWidth: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: context.secondary,
              ),
              child: Center(
                child: Text(
                  Get.find<ItemController>()
                      .items
                      .firstWhere((e) => e.id == item.id)
                      .selectedUnit
                      .quantityRemaining
                      .toString(),
                  style: context.titleMedium?.copyWith(
                    color: context.wightColor,
                  ),
                ),
              ),
            ),
            context.g12,
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
              child: DropdownButton<UnitDetails>(
                elevation: 1,
                isExpanded: true,
                borderRadius: BorderRadius.circular(10),
                items: item.unitDetails.map((value) {
                  return DropdownMenuItem<UnitDetails>(
                    alignment: AlignmentDirectional.center,
                    value: value,
                    child: Text(
                      value.name,
                      style: context.titleMedium,
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  itemController.items
                      .firstWhere(
                        (element) => element.id == item.id,
                      )
                      .selectedUnit = value ?? item.unitDetails[0];
                  itemController.refreshItemBillInfo(item);
                },
                hint: Text(
                  item.unitDetails
                      .firstWhere((e) => e.id == item.selectedUnit.id)
                      .name,
                  style: context.titleMedium,
                ),
                value: item.selectedUnit,
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
            const Spacer(),
            Text(
              'الوحدة',
              style: context.titleSmall,
            ),
          ],
        ),
      ),
    ]);
  }
}

class CounterItemWidget extends StatelessWidget {
  CounterItemWidget({
    super.key,
    required this.icon,
    required this.action,
  });

  final IconData icon;
  Function action;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      decoration: BoxDecoration(
        color: context.wightColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: IconButton(
          onPressed: () {
            //Get.back();
            action();
          },
          icon: Icon(
            icon,
            size: 15,
            color: context.secondaryTextColor,
          ),
        ),
      ),
    );
  }
}

class PriceDialogWidget extends StatelessWidget {
  const PriceDialogWidget({
    super.key,
    required this.number,
    this.isSelected = false,
    required this.action,
  });

  final int number;
  final bool isSelected;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        action();
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isSelected
                  ? Colors.transparent
                  : context.blackColor.withOpacity(0.1),
            ),
            color: isSelected ? context.primaryColor : null),
        child: Center(
          child: Text(
            number.toString(),
            style: context.bodyMeduim?.copyWith(
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

// class _CustomTextFieldWithLabelWidgetState
//     extends State<CustomTextFieldWithLabelWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       //height: 45,
//       alignment: Alignment.center,

//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: TextFormField(
//         keyboardType: TextInputType.number,
//         initialValue: widget.placeHolder ?? "",
//         textAlign: TextAlign.center,
//         textDirection: TextDirection.rtl,
//         onChanged: (value) {
//           if (widget.action != null) {
//             widget.action!(value);
//           }
//         },
//         onTap: () {
//           if (widget.onTap != null) {
//             widget.onTap!();
//           }
//         },
//         decoration: InputDecoration(
//           floatingLabelStyle: context.bodySmall,
//           floatingLabelBehavior: widget.isLabeled
//               ? FloatingLabelBehavior.always
//               : FloatingLabelBehavior.never,
//           fillColor: context.wightColor,
//           filled: true,
//           border: OutlineInputBorder(
//             borderSide: BorderSide(
//               color: context.secondaryTextColor.withOpacity(0.2),
//               width: 0,
//             ),
//             borderRadius: BorderRadius.circular(20),
//           ),
//           enabledBorder: OutlineInputBorder(
//             // width: 0.0 produces a thin "hairline" border
//             borderSide: BorderSide(
//               color: context.secondaryTextColor.withOpacity(0.2),
//               width: 0,
//             ),
//             borderRadius: BorderRadius.circular(20),
//           ),
//           label: widget.isLabeled
//               ? Text(
//                   widget.label,
//                 )
//               : null,
//           floatingLabelAlignment: FloatingLabelAlignment.center,
//           hintText: widget.textHint,
//           hintStyle: const TextStyle(
//             fontWeight: FontWeight.normal,
//             fontSize: 12,
//           ),
//           contentPadding: const EdgeInsets.only(bottom: 12),
//         ),
//       ),
//     );
//   }
// }
