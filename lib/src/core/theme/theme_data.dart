import 'package:era_pro_applicationlication/src/core/constants/assets.dart';
import 'package:era_pro_applicationlication/src/core/constants/colors.dart';
import 'package:era_pro_applicationlication/src/core/constants/text_style.dart';
import 'package:flutter/material.dart';

class AppThemData {
  static ThemeData lightThemeData = themeData(lightColorScheme);

  static ThemeData darkThemeData = themeData(darkColorScheme);
  static ThemeData themeData(
    ColorScheme colorScheme,
  ) {
    return ThemeData(
      colorScheme: colorScheme,
      canvasColor: colorScheme.surface,
      scaffoldBackgroundColor: colorScheme.surface,
      highlightColor: Colors.transparent,
      focusColor: colorScheme.primary,
      useMaterial3: true,
      fontFamily: Assets.fontFamily,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.secondaryTextColor.withOpacity(0.2),
            width: 0,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          // width: 0.0 produces a thin "hairline" border
          borderSide: BorderSide(
            color: AppColors.secondaryTextColor.withOpacity(0.2),
            width: 0,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      textTheme: TextTheme(
        displayLarge: AppTextStyle.displayLarge,
        displayMedium: AppTextStyle.displayMedium,
        displaySmall: AppTextStyle.displaySmall,
        titleLarge: AppTextStyle.titleLarge,
        titleMedium: AppTextStyle.titleMedium,
        titleSmall: AppTextStyle.titleSmall,
        bodyLarge: AppTextStyle.bodyLarge,
        bodySmall: AppTextStyle.bodySmall,
        bodyMedium: AppTextStyle.bodyMedium,
      ),
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: AppColors.primaryColor,
    onPrimary: Colors.white,
    secondary: AppColors.secondaryColor,
    onSecondary: Colors.white,
    error: Colors.redAccent,
    onError: Colors.white,
    surface: AppColors.sheetBgColor,
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );
  static const ColorScheme darkColorScheme = ColorScheme(
    primary: Color(0xFFFF8383),
    secondary: Color(0xFF4D1F7C),
    surface: Color(0xFF1F1929),
    error: Colors.redAccent,
    onError: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    brightness: Brightness.dark,
  );
}
