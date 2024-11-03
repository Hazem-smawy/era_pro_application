// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class CompleteSellingBillSummaryItemWidget extends StatelessWidget {
  const CompleteSellingBillSummaryItemWidget({
    super.key,
    required this.label,
    required this.value,
  });
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            value,
            style: context.titleMedium,
          ),
          const Spacer(),
          Text(
            label,
            style: context.bodyLarge,
          ),
        ],
      ),
    );
  }
}
