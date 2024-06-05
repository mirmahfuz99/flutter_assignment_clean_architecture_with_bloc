import 'dart:async';
import 'dart:convert';
import 'package:flutter_assignment/features/profile/data/models/user.dart';
import 'package:flutter_assignment/features/profile/data/models/user_preferences.dart';
import 'package:flutter_assignment/features/profile/domain/repository/user_repo.dart';
import 'package:flutter_assignment/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepositoryImpl implements UserRepository{
  User? _user;
  UserPreferences? _userPreferences;

  final SharedPreferences sharedPreferences;

  UserRepositoryImpl(this.sharedPreferences);



  @override
  Future<UserPreferences> getUserPreferences() async {
    if(_userPreferences != null) return _userPreferences!;

    UserPreferences userPreferences = sharedPreferences.getString(AppConstants.userPreference) != null ?
    UserPreferences.fromJson(jsonDecode(sharedPreferences.getString(AppConstants.userPreference)!)) : const UserPreferences();

    print(userPreferences.userEmail);
    return userPreferences;
  }


  @override
  Future<User> getUser() async {
    // print("inside_get_user");
    if (_user != null) return _user!;
    User user = sharedPreferences.getString(AppConstants.user) != null ?
    User.fromJson(jsonDecode(sharedPreferences.getString(AppConstants.user)!)) : const User();
    return user;
  }
}