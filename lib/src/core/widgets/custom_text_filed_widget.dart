import 'package:era_pro_applicationlication/src/core/constants/spaces.dart';
import 'package:era_pro_applicationlication/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget(
      {super.key, required this.controller, required this.label});
  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: context.bodyLarg,
        ),
        Gaps.g8,
        Directionality(
          textDirection: TextDirection.rtl,
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.name,
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '$label مطلوبة';
              }
              return null;
            },
            decoration: InputDecoration(
              fillColor: context.wightColor,
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
