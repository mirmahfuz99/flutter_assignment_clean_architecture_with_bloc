import 'package:flutter_assignment/features/profile/data/models/user.dart';
import 'package:flutter_assignment/features/profile/data/models/user_preferences.dart';

abstract class UserRepository {

  Future<UserPreferences> getUserPreferences();
  Future<User> getUser();
}