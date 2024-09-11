library text_style;

import 'package:era_pro_application/src/core/constants/assets.dart';
import 'package:era_pro_application/src/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//
class AppTextStyle {
  static TextStyle get displayLarge => TextStyle(
        fontSize: 20.sp,
        color: AppColors.blackColor,
        fontWeight: FontWeight.bold,
        fontFamily: Assets.fontFamily,
      );
  static TextStyle get displayMedium => TextStyle(
        fontSize: 18.sp,
        color: AppColors.blackColor,
        fontFamily: Assets.fontFamily,
        fontWeight: FontWeight.normal,
      );
  static TextStyle get displaySmall => TextStyle(
        fontSize: 17.sp,
        fontFamily: Assets.fontFamily,
        color: AppColors.blackColor,
      );
  static TextStyle get titleLarge => TextStyle(
        fontSize: 16.sp,
        color: AppColors.blackColor,
        fontFamily: Assets.fontFamily,
        fontWeight: FontWeight.bold,
      );
  static TextStyle get titleMedium => TextStyle(
        fontSize: 16.sp,
        fontFamily: Assets.fontFamily,
        color: AppColors.blackColor,
      );
  static TextStyle get titleSmall => TextStyle(
        fontSize: 15.sp,
        fontFamily: Assets.fontFamily,
        color: AppColors.secondaryTextColor,
      );
  static TextStyle get bodyLarge => TextStyle(
        fontSize: 12.sp,
        fontFamily: Assets.fontFamily,
        color: AppColors.secondaryTextColor,
        fontWeight: FontWeight.bold,
      );
  static TextStyle get bodyMedium => TextStyle(
        fontSize: 12.sp,
        fontFamily: Assets.fontFamily,
        color: AppColors.secondaryTextColor,
      );
  static TextStyle get bodySmall => TextStyle(
        fontSize: 11.sp,
        fontFamily: Assets.fontFamily,
        color: AppColors.secondaryTextColor,
        fontWeight: FontWeight.normal,
      );
}
