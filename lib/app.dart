import 'package:flutter/material.dart';
import 'package:flutter_assignment/config/routes/routes.dart';
import 'package:flutter_assignment/config/theme/light_theme.dart';
import 'package:flutter_assignment/features/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_assignment/features/login/data/repository/auth_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: sl(),
      child: BlocProvider(
        create: (_) => sl<AuthenticationBloc>(),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: light,
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                print("authenticated");
              case AuthenticationStatus.unauthenticated:
                print("unauthenticated");
              case AuthenticationStatus.unknown:
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: AppRoutes.onGenerateRoutes,
    );
  }
}