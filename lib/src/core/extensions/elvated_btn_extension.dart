import 'package:era_pro_application/src/core/constants/colors.dart';
import 'package:era_pro_application/src/core/constants/spaces_sizes.dart';
import 'package:era_pro_application/src/core/constants/text_style.dart';
import 'package:flutter/material.dart';

extension ElevatedButtonExtension on ElevatedButton {
  static ButtonStyle primaryStyle = ElevatedButton.styleFrom(
    elevation: 0,
    backgroundColor: AppColors.primaryColor, // Background color // Text color
    minimumSize: const Size.fromHeight(50),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side: BorderSide(
        color: AppColors.containerColor.withOpacity(0.5),
      ),
    ),
  );

  static ButtonStyle secondaryStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    elevation: 0,
    padding: const EdgeInsets.symmetric(
      horizontal: Spaces.sp16,
      vertical: Spaces.sp8,
    ),
    minimumSize: const Size.fromHeight(50),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side: BorderSide(
        color: AppColors.containerColor.withOpacity(0.5),
      ),
    ),
  );

  static ButtonStyle dangerStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.red,
    elevation: 0,
    padding: const EdgeInsets.symmetric(
      horizontal: Spaces.sp16,
      vertical: Spaces.sp8,
    ),
    minimumSize: const Size.fromHeight(50),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side: BorderSide(
        color: AppColors.containerColor.withOpacity(0.5),
      ),
    ),
  );

  static ElevatedButton primary(
      {required String label, required VoidCallback onPressed}) {
    return ElevatedButton(
      style: primaryStyle,
      onPressed: onPressed,
      child: Text(
        label,
        style: AppTextStyle.titleLarge.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }

  static ElevatedButton secondary(
      {required String label, required VoidCallback onPressed}) {
    return ElevatedButton(
      style: secondaryStyle,
      onPressed: onPressed,
      child: Text(
        label,
        style: AppTextStyle.titleLarge.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }

  static ElevatedButton danger(
      {required Widget child, required VoidCallback onPressed}) {
    return ElevatedButton(
      style: dangerStyle,
      onPressed: onPressed,
      child: child,
    );
  }
}
