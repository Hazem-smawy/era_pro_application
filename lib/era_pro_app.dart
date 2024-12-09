import 'package:era_pro_application/src/core/routes/app_pages.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

import 'src/core/theme/theme_data.dart';

class EraProApp extends StatelessWidget {
  const EraProApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1.0)),
          child: child!,
        );
      },
      theme: AppThemData.lightThemeData,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routesPage,
      initialRoute: AppPages.INITIAL,
    );
  }
}
