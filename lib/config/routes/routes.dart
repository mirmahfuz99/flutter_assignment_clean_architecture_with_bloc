import 'package:flutter/material.dart';
import 'package:flutter_assignment/features/bottom_nav/bottom_nav_page.dart';
import 'package:flutter_assignment/features/login/presentation/pages/login_page.dart';
import 'package:flutter_assignment/features/signup/presentation/pages/signup_page.dart';


class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute( const BottomNavScreen());

      case '/SignupPage':
        return _materialRoute(const SignUpPage());

      case '/SigninPage':
        return _materialRoute(const LoginPage());

      default:
        return _materialRoute(const LoginPage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
