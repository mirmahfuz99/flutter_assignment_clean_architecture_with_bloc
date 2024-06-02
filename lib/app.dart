import 'package:flutter/material.dart';
import 'package:flutter_assignment/config/theme/light_theme.dart';
import 'package:flutter_assignment/features/login/data/repository/auth_repository_impl.dart';
import 'package:flutter_assignment/features/profile/domain/repository/user_repo.dart';
import 'features/login/presentation/pages/login_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AuthenticationRepository _authenticationRepository;
  late final UserRepository _userRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: light,
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
