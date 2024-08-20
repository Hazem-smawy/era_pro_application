library route_pages;

import 'package:era_pro_application/src/core/middleware/auth_middleware.dart';
import 'package:era_pro_application/src/features/auth/presentation/getX/auth_binding.dart';
import 'package:era_pro_application/src/features/auth/presentation/pages/auth_page.dart';
import 'package:era_pro_application/src/features/home/presentation/pages/home_page.dart';
import 'package:era_pro_application/src/features/main_info/presentation/getX/main_info_binding.dart';
import 'package:era_pro_application/src/features/main_info/presentation/pages/company_info_page.dart';
import 'package:era_pro_application/src/features/user/presentation/getX/user_binding.dart';
import 'package:era_pro_application/src/features/home/presentation/pages/bottom_navigation_bar.dart';
import 'package:get/get.dart';
import 'routes.dart';

final routesPage = [
  GetPage(
    name: AppRouteName.auth.name,
    page: () => const AuthPage(),
    bindings: [
      AuthBinding(),
    ],
    middlewares: [
      AuthMiddleware(),
    ],
  ),
  GetPage(
    name: AppRouteName.home.name,
    page: () => const HomePage(),
  ),
  GetPage(
    name: AppRouteName.bnp.name,
    page: () => const BottomNavigationPage(),
  ),
  GetPage(
    name: AppRouteName.bnp.name,
    page: () => const BottomNavigationPage(),
  ),
  GetPage(
    name: AppRouteName.companyInfo.name,
    page: () => CompanyAndBranchInfoPage(),
  ),
];
