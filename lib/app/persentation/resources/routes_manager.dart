import 'package:flutter/material.dart';
import 'package:flutter_advanced_app/app/persentation/forget_password/forget_password.dart';
import 'package:flutter_advanced_app/app/persentation/login/login_view.dart';
import 'package:flutter_advanced_app/app/persentation/main/main_view.dart';
import 'package:flutter_advanced_app/app/persentation/register/register_view.dart';
import 'package:flutter_advanced_app/app/persentation/resources/strings_manager.dart';
import 'package:flutter_advanced_app/app/persentation/splash/splash_view.dart';
import 'package:flutter_advanced_app/app/persentation/store_details/store_details_view.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetialRoute = "/storeDetails";
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
