import 'package:flutter/material.dart';
import 'package:flutter_assignment/config/routes/route_name.dart';
import 'package:flutter_assignment/features/bottom_nav/bottom_nav_page.dart';
import 'package:flutter_assignment/features/login/presentation/pages/login_page.dart';
import 'package:flutter_assignment/features/signup/presentation/pages/signup_page.dart';
import 'package:flutter_assignment/features/splash/presentation/splash.dart';


class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {

      case RouteName.signupPage:
        return _materialRoute(const SignUpPage());

      case RouteName.signinPage:
        return _materialRoute(const LoginPage());

      case RouteName.bottomNavPage:
        return _materialRoute(const BottomNavScreen());

      case RouteName.splashPage:
        return _materialRoute(const SplashPage());

      default:
        return _materialRoute(const LoginPage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
