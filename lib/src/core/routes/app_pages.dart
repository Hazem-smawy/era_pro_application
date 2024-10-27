import 'package:era_pro_application/src/core/middleware/auth_middleware.dart';
import 'package:era_pro_application/src/features/auth/presentation/getX/auth_binding.dart';
import 'package:era_pro_application/src/features/auth/presentation/pages/auth_page.dart';
import 'package:era_pro_application/src/features/bills/presentation/pages/selling_bill_page.dart';
import 'package:era_pro_application/src/features/home/presentation/pages/home_page.dart';
import 'package:era_pro_application/src/features/main_info/presentation/pages/company_info_page.dart';
import 'package:era_pro_application/src/features/home/presentation/pages/bottom_navigation_bar.dart';
import 'package:era_pro_application/src/features/main_info/presentation/pages/curency_info_page.dart';
import 'package:era_pro_application/src/features/store/presentation/pages/store_info_details_page.dart';
import 'package:era_pro_application/src/features/store/presentation/pages/store_info_page.dart';
import 'package:era_pro_application/src/features/store/presentation/pages/units_page.dart';
import 'package:get/get.dart';

import '../../features/accounts/presentation/pages/acounts_tabview_page.dart';

part 'app_routes.dart';

class AppPages {
  // ignore: constant_identifier_names
  static const INITIAL = Routes.AUTH;
  static final routesPage = [
    GetPage(
      name: Routes.AUTH,
      page: () => const AuthPage(),
      bindings: [
        AuthBinding(),
      ],
      middlewares: [
        AuthMiddleware(),
      ],
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
    ),
    GetPage(
      name: Routes.BOTTOMNAVIGATIONBAR,
      page: () => const BottomNavigationPage(),
    ),
    GetPage(
      name: Routes.COMPANYINFO,
      page: () => CompanyAndBranchInfoPage(),
    ),
    GetPage(
      name: Routes.BILLS,
      page: () => SellingBillPage(),
    ),
    GetPage(
      name: Routes.CURRENCIES,
      page: () => CurenciesInfoPage(),
    ),
    GetPage(
      name: Routes.STORE,
      page: () => StoreInfoPage(),
    ),
    GetPage(
      name: Routes.STOREDETAILS,
      page: () => StoreInfoDetailsPage(),
    ),
    GetPage(
      name: Routes.UNTIS,
      page: () => UnitsPage(),
    ),
    GetPage(
      name: Routes.ACCOUNTS,
      page: () => AcountsTabviewPage(),
    ),
  ];
}
