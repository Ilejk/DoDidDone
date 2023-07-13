import 'package:flutter/material.dart';
import 'package:todo_app/common/utils/manager/strings.dart';
import 'package:todo_app/features/auth/pages/login_page.dart';
import 'package:todo_app/features/auth/pages/otp_page.dart';
import 'package:todo_app/features/onboarding/pages/onboarding_page.dart';
import 'package:todo_app/features/todo/pages/home_page.dart';

class Routes {
  static const String onBoardingRoute = '/';
  static const String homeRoute = '/homeRoute';
  static const String loginRoute = '/loginRoute';
  static const String otpRoute = '/otpRoute';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingPage());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case Routes.otpRoute:
        return MaterialPageRoute(builder: (_) => const OtpPage());

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
