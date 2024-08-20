import 'package:era_pro_application/src/core/constants/spaces_sizes.dart';
import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    super.key,
    required this.controller,
    required this.label,
    this.isNumber = false,
  });
  final TextEditingController controller;
  final String label;
  final bool isNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: context.bodyLarge,
        ),
        Gaps.g8,
        Directionality(
          textDirection: TextDirection.rtl,
          child: TextFormField(
            controller: controller,
            keyboardType: isNumber ? TextInputType.number : TextInputType.name,
            textAlign: TextAlign.right,
            textDirection: isNumber ? TextDirection.ltr : TextDirection.rtl,
            style: context.bodyLarge,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '$label مطلوبة';
              }
              return null;
            },
            decoration: InputDecoration(
              fillColor: context.wightColor,
              hintStyle: context.bodySmall,
              filled: true,
              floatingLabelAlignment: FloatingLabelAlignment.center,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
