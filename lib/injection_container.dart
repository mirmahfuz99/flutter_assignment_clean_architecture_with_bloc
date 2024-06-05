import 'package:dio/dio.dart';
import 'package:flutter_assignment/core/data/remote/api_endpoints.dart';
import 'package:flutter_assignment/core/data/remote/dio_client.dart';
import 'package:flutter_assignment/features/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_assignment/features/authentication/data/repository/auth_repository_impl.dart';
import 'package:flutter_assignment/features/edit_profile/bloc/edit_profile_bloc.dart';
import 'package:flutter_assignment/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter_assignment/features/profile/data/repository/user_repository_impl.dart';
import 'package:flutter_assignment/features/profile/domain/usecases/get_user.dart';
import 'package:flutter_assignment/features/profile/domain/usecases/get_user_preferences.dart';
import 'package:flutter_assignment/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter_assignment/features/signup/presentation/bloc/signup_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/profile/domain/repository/user_repo.dart';


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
  sl.registerSingleton<UserRepository>(
      UserRepositoryImpl(sl())
  );

  //UseCases
  sl.registerSingleton<GetUserUseCase>(GetUserUseCase(sl()));
  sl.registerSingleton<GetUserPreferencesUseCase>(GetUserPreferencesUseCase(sl()));


  //Blocs
  sl.registerFactory<AuthenticationBloc>(
      ()=> AuthenticationBloc( authenticationRepository: sl(), userRepository: sl())
  );

  sl.registerFactory<LoginBloc>(
      ()=> LoginBloc( authenticationRepository: sl())
  );
  sl.registerFactory<SignUpBloc>(
      ()=> SignUpBloc( authenticationRepository: sl())
  );

  sl.registerFactory<ProfileBloc>(
      ()=> ProfileBloc(sl(), sl())
  );
  sl.registerFactory<EditProfileBloc>(
      ()=> EditProfileBloc(authenticationRepository: sl())
  );

}