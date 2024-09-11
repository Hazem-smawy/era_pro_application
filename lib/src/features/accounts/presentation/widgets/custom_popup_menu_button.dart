import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomPopupMenuButton extends StatelessWidget {
  String? selectedItem;
  CustomPopupMenuButton({
    super.key,
    this.selectedItem,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      elevation: 0.2,
      position: PopupMenuPosition.under,
      color: context.surfaceColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      onSelected: (value) {
        selectedItem = value;
      },
      itemBuilder: (BuildContext context) {
        return {
          'كشف حساب',
          'كشف حساب تفصيلي',
        }
            .map((String choice) => PopupMenuItem<String>(
                  value: choice,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      choice,
                      textAlign: TextAlign.right,
                      style: context.bodyLarge,
                    ),
                  ),
                ))
            .toList();
      },
      child: Icon(
        Icons.more_vert_rounded,
        color: context.secondaryTextColor,
      ),
    );
  }
}
