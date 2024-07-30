library text_style;

import 'package:era_pro_applicationlication/src/core/constants/colors.dart';
import 'package:flutter/material.dart';

//
class AppTextStyle extends TextStyle {
  static TextStyle get displayLarge => const TextStyle(
        fontSize: 20,
        color: AppColors.blackColor,
        fontWeight: FontWeight.bold,
      );
  static TextStyle get displayMedium => const TextStyle(
        fontSize: 18,
        color: AppColors.blackColor,
        fontWeight: FontWeight.normal,
      );
  static TextStyle get displaySmall => const TextStyle(
        fontSize: 17,
        color: AppColors.blackColor,
      );
  static TextStyle get titleLarge => const TextStyle(
        fontSize: 16,
        color: AppColors.blackColor,
        fontWeight: FontWeight.bold,
      );
  static TextStyle get titleMedium => const TextStyle(
        fontSize: 16,
        color: AppColors.secondaryTextColor,
      );
  static TextStyle get titleSmall => const TextStyle(
        fontSize: 15,
        color: AppColors.secondaryTextColor,
      );
  static TextStyle get bodyLarge => const TextStyle(
        fontSize: 12,
        color: AppColors.secondaryTextColor,
        fontWeight: FontWeight.bold,
      );
  static TextStyle get bodyMedium => const TextStyle(
        fontSize: 12,
        color: AppColors.secondaryTextColor,
      );
  static TextStyle get bodySmall => const TextStyle(
        fontSize: 11,
        color: AppColors.secondaryTextColor,
      );
}
