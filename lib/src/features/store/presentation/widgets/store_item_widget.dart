import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/features/store/domain/entities/item_details_entity.dart';
import 'package:flutter/material.dart';

import '../../../../core/extensions/image_with_error_extension.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.itemEntity});

  final StoreItemDetailsEntity itemEntity;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.07),
                  offset: const Offset(0, 0),
                  spreadRadius: 3,
                  blurRadius: 15,
                )
              ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CustomImage.memoryWithError(
                  itemEntity.item.itemImage,
                  h: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: context.primaryColor,
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/avatar1.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     Container(
            //       width: 50,
            //       height: 25,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(12),
            //         color: context.secondary,
            //       ),
            //       child: Center(
            //         child: Text(
            //           '4',
            //           style: context.bodyLarge?.copyWith(
            //             color: context.wightColor,
            //           ),
            //         ),
            //       ),
            //     ),
            //     const SizedBox(
            //       width: 10,
            //     ),
            //     Expanded(
            //       child: Text(
            //         itemEntity.item.name,
            //         textAlign: TextAlign.end,
            //         style: context.titleMedium,
            //       ),
            //     ),
            //   ],
            // ),

            Container(
              padding: const EdgeInsets.all(5),
              width: double.infinity,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(12),
              //   border: Border.all(
              //     color: context.secondaryTextColor.withOpacity(0.3),
              //   ),
              // ),
              alignment: Alignment.centerRight,
              child: FittedBox(
                child: Text(
                  itemEntity.item.name,
                  style: context.titleMedium,
                ),
              ),
            ),
          ],
        ),
        Positioned(
          right: 5,
          top: 5,
          child: Container(
            width: 40,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: context.primary,
            ),
            child: Center(
              child: Text(
                itemEntity.totalQuantityInStore.toString(),
                style: context.bodyLarge?.copyWith(
                  color: context.wightColor,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
