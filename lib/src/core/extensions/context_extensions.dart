import 'package:era_pro_applicationlication/src/core/constants/colors.dart';
import 'package:flutter/material.dart';

extension BuildContextEntension<T> on BuildContext {
  bool get de => MediaQuery.of(this).size.width <= 500.0;

  bool get sm =>
      MediaQuery.of(this).size.width < 768.0 &&
      MediaQuery.of(this).size.width >= 500.0;

  bool get md =>
      MediaQuery.of(this).size.width < 1024.0 &&
      MediaQuery.of(this).size.width > 768.0;

  bool get lg => MediaQuery.of(this).size.width >= 1024.0;

  bool get isSmall => MediaQuery.of(this).size.width < 850.0;

  // double get width => MediaQuery.of(this).size.width;

  // double get height => MediaQuery.of(this).size.height;

  Size get size => MediaQuery.of(this).size;

  // text styles

  TextStyle? get displayLarge => Theme.of(this).textTheme.displayLarge;

  TextStyle? get displayMeduim => Theme.of(this).textTheme.displayMedium;

  TextStyle? get displaySmall => Theme.of(this).textTheme.displaySmall;

  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;

  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;

  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall;

  TextStyle? get bodyLarg => Theme.of(this).textTheme.labelLarge;

  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;

  TextStyle? get bodyMeduim => Theme.of(this).textTheme.bodyMedium;

  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;

  TextStyle? get dividerTextSmall => bodySmall?.copyWith(
      letterSpacing: 0.5, fontWeight: FontWeight.w700, fontSize: 12.0);

  TextStyle? get dividerTextLarge => bodySmall?.copyWith(
        letterSpacing: 1.5,
        fontWeight: FontWeight.w700,
        fontSize: 13.0,
        height: 1.23,
      );

  // colors

  Color get primaryColor => Theme.of(this).primaryColor;

  Color get primaryColorDark => Theme.of(this).primaryColorDark;

  Color get primaryColorLight => Theme.of(this).primaryColorLight;

  Color get primary => Theme.of(this).colorScheme.primary;

  Color get onPrimary => Theme.of(this).colorScheme.onPrimary;

  Color get secondary => Theme.of(this).colorScheme.secondary;

  Color get onSecondary => Theme.of(this).colorScheme.onSecondary;

  Color get cardColor => Theme.of(this).cardColor;

  Color get errorColor => Theme.of(this).colorScheme.error;

  Color get surfaceColor => Theme.of(this).colorScheme.surface;
  Color get containerColor => AppColors.containerColor;
  Color get secondaryTextColor => AppColors.secondaryTextColor;
  Color get wightColor => Colors.white;

  Color get blackColor => Colors.black;
  // Future<T?> showBottomSheet(
  //   Widget child, {
  //   bool isScrollControlled = true,
  //   Color? backgroundColor,
  //   Color? barrierColor,
  // }) {
  //   return showModalBottomSheet(
  //     context: this,
  //     barrierColor: barrierColor,
  //     isScrollControlled: isScrollControlled,
  //     backgroundColor: backgroundColor,
  //     builder: (context) => Wrap(children: [child]),
  //   );
  // }

  // ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
  //     String message) {
  //   return ScaffoldMessenger.of(this).showSnackBar(
  //     SnackBar(
  //       content: Text(message),
  //       behavior: SnackBarBehavior.floating,
  //       // backgroundColor: primary,
  //     ),
  //   );
  // }
}
