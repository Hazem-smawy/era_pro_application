enum AppRouteName { auth, home }

extension AppRouteExtension on AppRouteName {
  String get name {
    switch (this) {
      case AppRouteName.auth:
        return "/auth";
      case AppRouteName.home:
        return "/home";

      default:
        return "/";
    }
  }
}
