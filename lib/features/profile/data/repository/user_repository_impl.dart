import 'dart:async';
import 'package:flutter_assignment/features/profile/data/models/user.dart';
import 'package:flutter_assignment/features/profile/domain/repository/user_repo.dart';

class UserRepositoryImpl implements UserRepository{
  User? _user;

  @override
  Future<User?> getUser() async {
    if (_user != null) return _user;

    // save to local db when login done then read from there
    return Future.delayed(
      const Duration(milliseconds: 300),
          () => _user = const User("test@gmail.com", "Mr Test"),
    );
  }
}