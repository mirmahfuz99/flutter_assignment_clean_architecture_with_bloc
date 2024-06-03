import 'package:dio/dio.dart';
import 'package:flutter_assignment/core/data/remote/api_endpoints.dart';
import 'package:flutter_assignment/core/data/remote/dio_client.dart';
import 'package:flutter_assignment/features/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_assignment/features/login/data/repository/auth_repository_impl.dart';
import 'package:flutter_assignment/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter_assignment/features/profile/data/repository/user_repository_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';


String get baseUrl => APIPathHelper.baseUrl;

final sl = GetIt.instance;



Future<void> initializeDependencies() async {

  // Dio
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<DioClient>(DioClient(baseUrl: baseUrl,dio: sl()));

  final sharedPreferences = await SharedPreferences.getInstance();

  sl.registerSingleton<SharedPreferences>(sharedPreferences);

  sl.registerSingleton<AuthenticationRepositoryImpl>(
      AuthenticationRepositoryImpl(dioClient: sl(), sharedPreferences: sl())
  );

  sl.registerSingleton<UserRepositoryImpl>(
      UserRepositoryImpl(sl())
  );

  //Blocs
  sl.registerFactory<AuthenticationBloc>(
      ()=> AuthenticationBloc( authenticationRepository: sl(), userRepository: sl())
  );

  sl.registerFactory<LoginBloc>(
      ()=> LoginBloc( authenticationRepository: sl())
  );

}