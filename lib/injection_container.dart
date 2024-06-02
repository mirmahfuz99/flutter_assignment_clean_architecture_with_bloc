import 'package:flutter_assignment/features/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_assignment/features/login/data/repository/auth_repository_impl.dart';
import 'package:flutter_assignment/features/login/domain/repository/auth_repository.dart';
import 'package:flutter_assignment/features/login/presentation/bloc/login_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  sl.registerSingleton<AuthRepository>(
      AuthenticationRepositoryImpl()
  );

  //Blocs
  sl.registerFactory<AuthenticationBloc>(
      ()=> AuthenticationBloc( authenticationRepository: sl(), userRepository: sl())
  );

  sl.registerFactory<LoginBloc>(
      ()=> LoginBloc(authenticationRepository: sl())
  );


}