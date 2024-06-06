import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_assignment/core/data/remote/api_endpoints.dart';
import 'package:flutter_assignment/core/data/remote/dio_client.dart';
import 'package:flutter_assignment/features/authentication/data/repository/auth_repository.dart';
import 'package:flutter_assignment/features/profile/data/models/user.dart';
import 'package:flutter_assignment/features/profile/data/models/user_preferences.dart';
import 'package:flutter_assignment/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated, registered }

class AuthenticationRepositoryImpl implements AuthRepository{
  late SharedPreferences sharedPreferences;

  final _controller = StreamController<AuthenticationStatus>();

  late DioClient dioClient;

  AuthenticationRepositoryImpl({required this.dioClient, required this.sharedPreferences});


  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.authenticated;
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
      final userPreferences = UserPreferences.fromJson(httpResponse);
      sharedPreferences.setString(AppConstants.userPreference, jsonEncode(userPreferences));
      _controller.add(AuthenticationStatus.authenticated);

    } on DioException catch(e){
      print(e);
    }
  }

  //auth service will be called here
  @override
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {

    try {
      var data = {"username":name, "email":email, "password":password};
      final httpResponse = await dioClient.post(
          APIPathHelper.signup(),
          data: data,
      );
      print(httpResponse['message']);
      _controller.add(AuthenticationStatus.registered);
    } on DioException catch(e){
      if (kDebugMode) {
        print(e);
      }
    }
  }


  @override
  Future<void> updateProfile({required String firstName, required String lastName}) async {
    print("inside_update_profile");
    var token = UserPreferences.fromJson(jsonDecode(sharedPreferences.getString(AppConstants.userPreference)!)).token??'';

    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $token'
    };

    final httpResponse = await dioClient.post(
      APIPathHelper.updateProfile(firstName: firstName,lastName: lastName),
      // queryParameters: param,
      options: Options(headers: headers),
    );

    final user = User.fromJson(httpResponse);
    sharedPreferences.setString(AppConstants.user, jsonEncode(user));
    print("first_saved");
  }

  @override
  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();

}