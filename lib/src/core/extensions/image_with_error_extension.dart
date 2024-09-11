import 'dart:typed_data';

import 'package:era_pro_application/src/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension CustomImage on Image {
  static Widget memoryWithError(Uint8List? imageData,
      {double? w,
      double? h,
      BoxFit? fit,
      BoxDecoration decoration = const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.whiteColor,
      )}) {
    return SizedBox(
      width: w,
      height: h,
      child: imageData != null
          ? Image.memory(
              fit: fit ?? BoxFit.cover,
              width: w ?? double.infinity,
              height: h ?? double.infinity,
              imageData,
              errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
                return Container(
                  width: w,
                  height: h,
                  decoration: decoration,
                );
              },
            )
          : Container(
              width: w,
              height: h,
              decoration: decoration,
            ),
    );
  }

  static Widget memoryWithErorrAndLoading(Uint8List? imageData,
      {required ImageProvider fallbackImage, double w = 50, double h = 50}) {
    return SizedBox(
      width: w.w,
      height: h.h,
      child: FutureBuilder<Uint8List>(
        future: Future.value(imageData ?? Uint8List(0)),
        builder: (BuildContext context, AsyncSnapshot<Uint8List> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Image(image: fallbackImage);
          } else {
            return Image.memory(
              snapshot.data!,
              fit: BoxFit.cover,
              errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
                return Image(image: fallbackImage);
              },
            );
          }
        },
      ),
    );
  }
}
