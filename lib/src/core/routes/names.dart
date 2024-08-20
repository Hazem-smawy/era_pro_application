enum AppRouteName { auth, home, bnp, companyInfo }

extension AppRouteExtension on AppRouteName {
  String get name {
    switch (this) {
      case AppRouteName.auth:
        return "/auth";
      case AppRouteName.home:
        return "/home";
      case AppRouteName.bnp:
        return '/bnp';
      case AppRouteName.companyInfo:
        return '/companyInfo';
      default:
        return "/";
    }
  }
}
