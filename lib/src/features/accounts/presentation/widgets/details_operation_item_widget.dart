import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class DetailsOperationItemWidget extends StatelessWidget {
  const DetailsOperationItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: context.whiteColor,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\$989.55',
                style: context.titleLarge.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                '2024/4/2',
                style: context.bodySmall,
              ),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'محمد علي محمد',
                  style: context.bodyLarge,
                ),
                context.g4,
                Text(
                  'إرسال أموال',
                  style: context.bodySmall.copyWith(
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          context.g8,
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.red.withOpacity(0.1),
            child: const Icon(
              Icons.trending_down,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
