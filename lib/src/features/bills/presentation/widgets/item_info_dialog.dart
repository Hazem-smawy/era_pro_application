import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/padding_extension.dart';
import 'package:era_pro_application/src/core/widgets/custom_text_field_with_label_widget.dart';
import 'package:era_pro_application/src/features/bills/presentation/getX/bills_controller.dart';
import 'package:era_pro_application/src/features/bills/presentation/getX/bills_getx.dart';
import 'package:era_pro_application/src/features/bills/presentation/widgets/free_quantity_widget.dart';
import 'package:era_pro_application/src/features/bills/presentation/widgets/item_dialog_info_discount_widget.dart';
import 'package:era_pro_application/src/features/bills/presentation/widgets/item_dialog_info_name_and_unit_widget.dart';
import 'package:era_pro_application/src/features/bills/presentation/widgets/item_dialog_info_price_and_total_units_widget.dart';
import 'package:era_pro_application/src/features/bills/presentation/widgets/item_info_dialog_tax_and_notes_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../domain/entities/bill_ui_entity.dart';

class ItemInfoDialg extends StatefulWidget {
  final Rx<ItemUI> item;

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
            left: 15,
            right: 15,
            top: 50,
            bottom: 20,
          ),
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: context.bg,
            ),
            child: Container(
              // resizeToAvoidBottomInset: false,
              color: context.bg,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ItemDialogInfoNameAndUnitWidget(
                    item: widget.item.value,
                  ),
                  context.g4,
                  Divider(
                    color: context.secondaryTextColor.withOpacity(0.1),
                  ),
                  context.g4,
                  ItemDialogInfoPriceAndTotalUnitsWidget(
                    item: widget.item.value,
                  ),
                  context.g4,
                  Divider(
                    color: context.secondaryTextColor.withOpacity(0.1),
                  ),
                  context.g4,
                  ItemDialogInfoDiscountWidget(item: widget.item.value),
                  context.g4,
                  Divider(
                    color: context.secondaryTextColor.withOpacity(0.1),
                  ),
                  context.g4,
                  ItemInfoDialogTaxAndNotesWidget(
                    item: widget.item,
                  ),
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
