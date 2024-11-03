import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class CounterItemWidget extends StatelessWidget {
  CounterItemWidget({
    super.key,
    required this.icon,
    required this.action,
  });

  final IconData icon;
  Function action;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      decoration: BoxDecoration(
        color: context.wightColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: IconButton(
          onPressed: () {
            //Get.back();
            action();
          },
          icon: Icon(
            icon,
            size: 15,
            color: context.secondaryTextColor,
          ),
        ),
      ),
    );
  }
}
