// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class HomeSummaryItemWidget extends StatelessWidget {
  const HomeSummaryItemWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
  });
  final String title;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: context.whiteColor,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: context.bodyLarge,
                ),
                const SizedBox(
                  width: 5,
                ),
                Icon(
                  icon,
                  color: color,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '\$567,098',
                  style: context.titleMedium.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'اليوم',
                  style: context.bodySmall,
                ),
                const SizedBox(
                  width: 5,
                ),
                CircleAvatar(
                  radius: 3,
                  backgroundColor: Colors.green.withOpacity(0.2),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: FittedBox(
                    child: Text(
                      '\$567,098',
                      style: context.bodyLarge.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'الإجمالي',
                  style: context.bodySmall,
                ),
                const SizedBox(
                  width: 5,
                ),
                CircleAvatar(
                  radius: 3,
                  backgroundColor: Colors.red.withOpacity(0.2),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
