import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';

class DetailsAccountsInfoItem extends StatelessWidget {
  final String value;
  final IconData icon;
  const DetailsAccountsInfoItem({
    super.key,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          value.isEmpty ? 'لا يوجد' : value,
          style: context.bodyLarge,
        ),
        context.g8,
        Icon(
          icon,
          size: 20,
          color: context.secondaryTextColor,
        ),
      ],
    ).phv(h: 20, v: 7);
  }
}
