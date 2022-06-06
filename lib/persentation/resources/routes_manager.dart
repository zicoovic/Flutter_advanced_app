import 'package:flutter/material.dart';
import 'package:flutter_advanced_app/persentation/on_boarding/on_boarding.dart';

import '../forget_password/forget_password.dart';
import '../login/login_view.dart';
import '../main/main_view.dart';
import '../register/register_view.dart';
import '../splash/splash_view.dart';
import '../store_details/store_details_view.dart';
import 'strings_manager.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetialRoute = "/storeDetails";
  static const String onBoardingRoute = "/onBoarding";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(
            builder: (context) => const ForgetPasswordView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (context) => const RegisterView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (context) => const MainView());
      case Routes.storeDetialRoute:
        return MaterialPageRoute(
            builder: (context) => const StoreDetailsView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (context) => const OnBoardingView());
      default:
        return unDefindRoute();
    }
  }

  static Route<dynamic> unDefindRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(
          child: Text(AppStrings.noRouteFound),
        ), // todo move this string to strings Manager
      ),
    );
  }
}
