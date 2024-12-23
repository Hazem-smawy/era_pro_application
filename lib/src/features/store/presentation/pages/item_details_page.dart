import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/image_with_error_extension.dart';
import 'package:era_pro_application/src/core/extensions/padding_extension.dart';
import 'package:era_pro_application/src/core/utils/currency_format.dart';
import 'package:era_pro_application/src/features/store/domain/entities/item_details_entity.dart';

import 'package:era_pro_application/src/features/store/presentation/getX/store_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'dart:typed_data';

import '../../../../core/widgets/custom_appbar_widget.dart';

class ItemDetailsPage extends StatelessWidget {
  final StoreItemDetailsEntity storeItemDetailsEntity;
  final StoreController storeController = Get.find();

  ItemDetailsPage({super.key, required this.storeItemDetailsEntity}) {
    // Initialize selectedPriceIndex for each unit
    for (var unitDetail in storeItemDetailsEntity.itemUnitsDetails) {
      storeController.selectedPriceIndex[unitDetail.hashCode] = 0.obs;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              context.g8,
              const CustomAppBarWidget(title: 'تفاصيل المنتج'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildItemMainInfoWidget(context),
                    context.g20,
                    _buildUnitsAndPricessWidget(context),
                    context.g20,
                    Text(
                      storeItemDetailsEntity.item.note,
                      textDirection: TextDirection.rtl,
                      style: context.bodySmall,
                    ),
                    context.g20,
                    _buildAdditionalDetails(context),
                    context.g20,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _buildItemMainInfoWidget(BuildContext context) {
    return Column(children: [
      context.g20,
      ItemStoreImageWidget(storeItemDetailsEntity: storeItemDetailsEntity),
      context.g12,
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: context.width - 40,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        storeItemDetailsEntity.item.name,
                        textAlign: TextAlign.right,
                        overflow: TextOverflow.clip,
                        style: context.displayMedium.copyWith(
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              context.g4,
              Text(
                storeItemDetailsEntity.item.itemDescription,
                style: context.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    ]);
  }

  Column _buildUnitsAndPricessWidget(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Text(
        'الوحدات والأسعار',
        style: context.titleMedium,
      ),
      context.g12,
      if (storeItemDetailsEntity.itemUnits?.isNotEmpty ?? false)
        ListView.separated(
          itemCount: storeItemDetailsEntity.itemUnits!.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (BuildContext context, int index) => context.g16,
          itemBuilder: (BuildContext context, int index) {
            return ItemUnitsDetailsWidget(
              item: storeItemDetailsEntity,
              itemUnitDetails: storeItemDetailsEntity.itemUnitsDetails[index],
              isMain: true,
            );
          },
        ),
    ]);
  }

  Widget _buildAdditionalDetails(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: context.secondaryTextColor.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildDetailSection(
            title: 'مجموعة الصنف',
            value: storeItemDetailsEntity.group?.name ?? " ",
            context: context,
          ),
          context.g12,
          _buildDetailSection(
            title: 'الشركة المصنعة',
            value: storeItemDetailsEntity.item.itemCompany,
            context: context,
          ),
        ],
      ),
    );
  }

  Widget _buildDetailSection({
    required String title,
    required String value,
    required BuildContext context,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(title, style: context.bodySmall),
        Text(value, style: context.titleMedium),
      ],
    );
  }
}

class ItemStoreImageWidget extends StatefulWidget {
  const ItemStoreImageWidget({
    super.key,
    required this.storeItemDetailsEntity,
  });

  final StoreItemDetailsEntity storeItemDetailsEntity;

  @override
  State<ItemStoreImageWidget> createState() => _ItemStoreImageWidgetState();
}

class _ItemStoreImageWidgetState extends State<ItemStoreImageWidget> {
  Uint8List? imageData;

  StoreController storeController = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    storeController.getItemImage(widget.storeItemDetailsEntity.item.id).then(
      (value) {
        setState(() {
          imageData = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: context.secondaryTextColor.withOpacity(0.3),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CustomImage.memoryWithError(
          imageData,
          h: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

class ItemUnitsDetailsWidget extends StatelessWidget {
  final ItemUnitDetailsEntity itemUnitDetails;
  final bool isMain;
  final StoreItemDetailsEntity item;

  ItemUnitsDetailsWidget({
    super.key,
    required this.itemUnitDetails,
    this.isMain = false,
    required this.item,
  });

  final StoreController storeController = Get.find();

  @override
  Widget build(BuildContext context) {
    // Default to first price (index 0)

    return Obx(
      () => Column(
        children: [
          ItemDetailsUnitWidget(
            quantity: item.totalQuantityInStore ~/ itemUnitDetails.unitFactor,
            isMain: itemUnitDetails.unitFactor == 1,
            name: itemUnitDetails.unitName,
          ),
          context.g8,
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    // color: MyColors.containerColor,
                    border: Border.all(
                      color: context.secondaryTextColor.withOpacity(0.2),
                    ),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          currencyFormat(
                              number: ' ${storeController.getSelectedPrice(
                                    itemUnitDetails.hashCode,
                                    itemUnitDetails.prices,
                                  ).toStringAsFixed(2)}'),
                          style: context.titleSmall
                              .copyWith(color: context.blackColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              context.g20,
              Row(
                children: [
                  PriceDialogWidget(
                    id: 3,
                    isSelected: storeController
                            .selectedPriceIndex[itemUnitDetails.hashCode]
                            ?.value ==
                        2,
                    action: () {
                      storeController.updatePriceIndex(
                          itemUnitDetails.hashCode, 2);
                    },
                  ),
                  context.g8,
                  PriceDialogWidget(
                    id: 2,
                    isSelected: storeController
                            .selectedPriceIndex[itemUnitDetails.hashCode]
                            ?.value ==
                        1,
                    action: () {
                      storeController.updatePriceIndex(
                        itemUnitDetails.hashCode,
                        1,
                      );
                    },
                  ),
                  context.g8,
                  PriceDialogWidget(
                    id: 1,
                    isSelected: storeController
                            .selectedPriceIndex[itemUnitDetails.hashCode]
                            ?.value ==
                        0,
                    action: () {
                      storeController.updatePriceIndex(
                          itemUnitDetails.hashCode, 0);
                    },
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class PriceDialogWidget extends StatelessWidget {
  const PriceDialogWidget({
    super.key,
    required this.isSelected,
    required this.id,
    required this.action,
  });

  final int id;
  final bool isSelected;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        action();
      },
      child: Container(
        width: 45,
        height: 45,
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
            id.toString(),
            style: TextStyle(
              fontSize: 16,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class ItemDetailsUnitWidget extends StatelessWidget {
  const ItemDetailsUnitWidget({
    super.key,
    required this.isMain,
    required this.name,
    required this.quantity,
  });
  final bool isMain;
  final String name;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: context.containerColor,
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Text(
              quantity.toString(),
              textAlign: TextAlign.left,
              style: context.titleLarge,
            ).pl(10),
          ),
          context.g8,
          Text(
            ':الكمية',
            textAlign: TextAlign.left,
            style: context.bodySmall,
          ),
          context.g8,
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  name,
                  style: context.titleMedium,
                ),
                context.g12,
                isMain
                    ? const FaIcon(
                        FontAwesomeIcons.solidStar,
                        size: 20,
                        color: Color.fromARGB(255, 206, 132, 4),
                      ).pr(5)
                    : const SizedBox(
                        width: 0,
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
