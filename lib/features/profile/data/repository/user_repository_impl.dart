import 'dart:async';
import 'dart:convert';
import 'package:flutter_assignment/features/profile/data/models/user.dart';
import 'package:flutter_assignment/features/profile/domain/repository/user_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepositoryImpl implements UserRepository{
  User? _user;

  final SharedPreferences sharedPreferences;

  UserRepositoryImpl(this.sharedPreferences);


  @override
  Future<User> getUser() async {
    if (_user != null) return _user!;

    // save to local db when login done then read from there

    User user = User.fromJson(jsonDecode(sharedPreferences.getString('user')!));

    return user;
  }
}