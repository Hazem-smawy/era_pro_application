import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class CircleIconBtnWidget extends StatelessWidget {
  final VoidCallback action;
  const CircleIconBtnWidget({
    super.key,
    required this.icon,
    required this.action,
  });
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 38,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: context.secondaryTextColor.withOpacity(0.1),
        ),
      ),
      child: Center(
        child: IconButton(
          onPressed: () => action(),
          icon: Icon(
            icon,
            color: context.secondaryTextColor,
            size: 20,
          ),
        ),
      ),
    );
  }
}
