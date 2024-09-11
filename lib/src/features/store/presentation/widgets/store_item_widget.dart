import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/features/store/domain/entities/item_entity.dart';
import 'package:flutter/material.dart';

import '../../../../core/extensions/image_with_error_extension.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.itemEntity});

  final ItemEntity itemEntity;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            CustomImage.memoryWithError(
              itemEntity.itemImage,
              h: 100,
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
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 50,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: context.secondary,
                  ),
                  child: Center(
                    child: Text(
                      '4',
                      style: context.bodyLarge?.copyWith(
                        color: context.wightColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    itemEntity.name,
                    textAlign: TextAlign.end,
                    style: context.titleMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: context.secondaryTextColor.withOpacity(0.3),
                ),
              ),
              child: Center(
                child: Text(
                  100.toString(),
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
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: context.secondaryTextColor,
            ),
            child: Center(
              child: Text(
                '4',
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
