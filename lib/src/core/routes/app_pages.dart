import 'package:era_pro_application/src/core/middleware/auth_middleware.dart';
import 'package:era_pro_application/src/features/async/presentation/pages/loading_page.dart';
import 'package:era_pro_application/src/features/auth/presentation/getX/auth_binding.dart';
import 'package:era_pro_application/src/features/auth/presentation/pages/auth_page.dart';
import 'package:era_pro_application/src/features/bills/presentation/pages/all_bills_page.dart';
import 'package:era_pro_application/src/features/bills/presentation/pages/selling_bill_page.dart';
import 'package:era_pro_application/src/features/exchange_receipt/presentation/pages/exchange_page.dart';
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
      page: () => const CompanyAndBranchInfoPage(),
    ),
    GetPage(
      name: Routes.SELLINGPAGE,
      page: () => const SellingBillPage(),
    ),
    GetPage(
      name: Routes.CURRENCIES,
      page: () => CurenciesInfoPage(),
    ),
    GetPage(
      name: Routes.STORE,
      page: () => const StoreInfoPage(),
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
      page: () => const AcountsTabviewPage(),
    ),
    GetPage(
      name: Routes.ALLBILLS,
      page: () => const AllBillsPage(),
    ),
    GetPage(
      name: Routes.EXCHANGE,
      page: () => const AllExhangePage(),
    ),
    GetPage(
      name: Routes.LOADING,
      page: () => const LoadingPage(),
    ),
  ];
}
