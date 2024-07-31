library route_pages;

import 'package:era_pro_applicationlication/src/core/middleware/auth_middleware.dart';
import 'package:era_pro_applicationlication/src/features/auth/presentation/getX/auth_binding.dart';
import 'package:era_pro_applicationlication/src/features/auth/presentation/pages/auth_page.dart';
import 'package:era_pro_applicationlication/src/features/home/presentation/pages/home_page.dart';
import 'package:era_pro_applicationlication/src/features/user/presentation/getX/user_binding.dart';
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
    bindings: [
      UserBinding(),
    ],
  ),
];
