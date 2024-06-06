import 'package:flutter/material.dart';
import 'package:flutter_assignment/config/routes/route_name.dart';
import 'package:flutter_assignment/config/routes/routes.dart';
import 'package:flutter_assignment/config/theme/light_theme.dart';
import 'package:flutter_assignment/features/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_assignment/features/authentication/data/repository/auth_repository_impl.dart';
import 'package:flutter_assignment/features/home/presentation/bloc/product_bloc.dart';
import 'package:flutter_assignment/features/home/presentation/bloc/product_event.dart';
import 'package:flutter_assignment/injection_container.dart';
import 'package:flutter_assignment/utils/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: sl<AuthenticationRepositoryImpl>(),
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
  final SharedPreferences sharedPreferences = GetIt.instance<SharedPreferences>();
  final _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get _navigator => _navigatorKey.currentState!;


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (_) => sl<ProductBloc>()..add(const GetProducts()),
        ),
      ],
      child: MaterialApp(
        theme: light,
        navigatorKey: _navigatorKey,
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              switch (state.status) {
                case AuthenticationStatus.authenticated:
                  _navigator.pushNamedAndRemoveUntil(RouteName.bottomNavPage, (route) => false);
                case AuthenticationStatus.unauthenticated:
                  _navigator.pushNamedAndRemoveUntil(RouteName.signinPage, (route) => false);
                case AuthenticationStatus.registered:
                  _navigator.pushNamedAndRemoveUntil(RouteName.signinPage, (route) => false);
                case AuthenticationStatus.unknown:
                  break;
              }
            },
            child: child,
          );
        },
        initialRoute: sharedPreferences.getString(AppConstants.userPreference) != null ?  RouteName.bottomNavPage : RouteName.signinPage,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
      ),
    );
  }
}