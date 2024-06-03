import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_assignment/core/data/remote/api_endpoints.dart';
import 'package:flutter_assignment/core/data/remote/dio_client.dart';
import 'package:flutter_assignment/features/login/domain/repository/auth_repository.dart';
import 'package:flutter_assignment/features/profile/data/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepositoryImpl implements AuthRepository{
  late SharedPreferences sharedPreferences;

  final _controller = StreamController<AuthenticationStatus>();

  late DioClient dioClient;

  AuthenticationRepositoryImpl({required this.dioClient, required this.sharedPreferences});


  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  //auth service will be called here
  @override
  Future<void> logIn({
    required String username,
    required String password,
  }) async {

    try {
      final httpResponse = await dioClient.post(APIPathHelper.login(userName: username,password: password));
      final user = User.fromJson(httpResponse);
      sharedPreferences.setString('user', jsonEncode(user));
      _controller.add(AuthenticationStatus.authenticated);

    } on DioException catch(e){
      print(e);
    }
  }

  @override
  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}