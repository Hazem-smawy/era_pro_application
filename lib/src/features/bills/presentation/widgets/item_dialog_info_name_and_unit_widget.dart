import 'package:era_pro_application/src/core/constants/strings.dart';
import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/features/bills/presentation/getX/bills_controller.dart';
import 'package:era_pro_application/src/features/store/domain/entities/item_details_entity.dart';
import 'package:era_pro_application/src/features/store/presentation/pages/item_details_page.dart';
import 'package:era_pro_application/src/features/store/presentation/pages/store_info_details_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../domain/entities/bill_ui_entity.dart';

class ItemDialogInfoNameAndUnitWidget extends StatelessWidget {
  ItemDialogInfoNameAndUnitWidget({super.key, required this.item});
  BillController itemController = Get.find();
  ItemUI item;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GestureDetector(
        onTap: () async {
          final itemDetails = await itemController.getItemStoreDetails(item);
          Get.to(ItemDetailsPage(
            storeItemDetailsEntity: itemDetails,
          ));
        },
        child: Row(
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
                  Get.find<BillController>()
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
              child: DropdownButton<UnitDetailsUI>(
                elevation: 1,
                isExpanded: true,
                borderRadius: BorderRadius.circular(10),
                items: item.unitDetails.map((value) {
                  return DropdownMenuItem<UnitDetailsUI>(
                    alignment: AlignmentDirectional.center,
                    value: value,
                    child: Text(
                      value.name,
                      style: context.titleMedium,
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  itemController.changeUnit(value, item);
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
