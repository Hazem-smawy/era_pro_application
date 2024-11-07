import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/features/bills/presentation/getX/bills_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../core/utils/perecent_caculator.dart';
import '../../../../core/widgets/custom_text_field_with_label_widget.dart';
import '../../domain/entities/bill_ui_entity.dart';

class FreeQuantityWidget extends StatefulWidget {
  const FreeQuantityWidget({
    super.key,
    required this.item,
    required this.itemController,
  });

  final ItemUI item;
  final BillController itemController;

  @override
  State<FreeQuantityWidget> createState() => _FreeQuantityWidgetState();
}

class _FreeQuantityWidgetState extends State<FreeQuantityWidget> {
  BillController itemController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          // Display remaining quantity in store
          // Container(
          //   width: 40,
          //   height: 40,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10),
          //     border: Border.all(
          //       color: context.secondaryTextColor.withOpacity(0.2),
          //     ),
          //   ),
          //   child: Center(
          //     child: Text(
          //       itemController.items
          //           .firstWhere((e) => e.id == widget.item.id)
          //           .unitDetails
          //           .firstWhere((e) => e.id == widget.item.freeUnitId)
          //           .quantityRemaining
          //           .toString(),
          //       style: context.bodyMeduim,
          //     ),
          //   ),
          // ),
          context.g12,
          // Expanded(
          //   child: Container(
          //     height: 40,
          //     width: Get.width / 2.5,
          //     alignment: Alignment.center,
          //     padding: const EdgeInsets.symmetric(horizontal: 10),
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(20),
          //       border: Border.all(
          //         color: context.secondaryTextColor.withOpacity(0.5),
          //       ),
          //     ),
          //     child: DropdownButton<int>(
          //       elevation: 1,
          //       isExpanded: true,
          //       borderRadius: BorderRadius.circular(10),
          //       items: widget.item.unitDetails.map((value) {
          //         return DropdownMenuItem<int>(
          //           alignment: AlignmentDirectional.center,
          //           value: value.id,
          //           child: Text(
          //             value.name,
          //             style: context.titleMedium,
          //           ),
          //         );
          //       }).toList(),
          //       onChanged: (value) {
          //         var updatedItem = itemController.items.firstWhere(
          //           (element) => element.id == widget.item.id,
          //         );
          //         updatedItem.freeUnitId = value ?? widget.item.freeUnitId;

          //         setState(() {});
          //       },
          //       hint: Text(
          //         itemController.items
          //             .firstWhere((e) => e.id == widget.item.id)
          //             .unitDetails
          //             .firstWhere((e) => e.id == widget.item.freeUnitId)
          //             .name,
          //         style: context.titleMedium,
          //       ),
          //       value: widget.item.freeUnitId,
          //       underline: const SizedBox(),
          //       icon: Padding(
          //         padding: const EdgeInsets.only(right: 10),
          //         child: FaIcon(
          //           FontAwesomeIcons.chevronDown,
          //           size: 15,
          //           color: context.secondaryTextColor,
          //         ),
          //       ),
          //       alignment: AlignmentDirectional.center,
          //     ),
          //   ),
          // ),
          // context.g36,
          // Minus button to decrement freeQuantity

          // const Spacer(),
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
          const Spacer(),
          Text(
            'الكمية المجانية',
            style: context.bodySmall,
          ),
        ],
      ),
    );
  }
}
