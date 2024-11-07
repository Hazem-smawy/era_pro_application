
import 'package:era_pro_application/src/core/routes/app_pages.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'src/core/theme/theme_data.dart';

class EraProApp extends StatelessWidget {
  const EraProApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, ch) => GetMaterialApp(
        theme: AppThemData.lightThemeData,
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        getPages: AppPages.routesPage,
        initialRoute: AppPages.INITIAL,
        // home: ItemListPage(),
      ),
    );
  }
}
