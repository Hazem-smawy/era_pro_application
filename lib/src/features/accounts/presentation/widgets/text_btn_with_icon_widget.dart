import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class TextBtnWithIconWidget extends StatelessWidget {
  final String label;
  final VoidCallback action;
  final Color color;
  const TextBtnWithIconWidget({
    super.key,
    required this.label,
    required this.action,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        action();
      },
      child: Row(
        children: [
          Text(
            label,
            style: context.bodyMedium.copyWith(
              color: color,
            ),
          ),
          context.g8,
          Icon(
            Icons.add,
            size: 25,
            color: color,
          ),
        ],
      ),
    );
  }
}
