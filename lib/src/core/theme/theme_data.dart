import 'package:era_pro_application/src/core/constants/assets.dart';
import 'package:era_pro_application/src/core/constants/colors.dart';
import 'package:era_pro_application/src/core/constants/text_style.dart';
import 'package:flutter/material.dart';

class AppThemData {
  static ThemeData lightThemeData = themeData(lightColorScheme);

  static ThemeData darkThemeData = themeData(lightColorScheme);
  static ThemeData themeData(
    ColorScheme colorScheme,
  ) {
    return ThemeData(
      colorScheme: colorScheme,
      canvasColor: AppColors.bg,
      scaffoldBackgroundColor: AppColors.bg,
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
        focusedBorder: OutlineInputBorder(
          // width: 0.0 produces a thin "hairline" border
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        errorBorder: OutlineInputBorder(
          // width: 0.0 produces a thin "hairline" border
          borderSide: const BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedErrorBorder: OutlineInputBorder(
          // width: 0.0 produces a thin "hairline" border
          borderSide: const BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      textTheme: TextTheme.lerp(
          TextTheme(
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
          const TextTheme(),
          1),
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
}
