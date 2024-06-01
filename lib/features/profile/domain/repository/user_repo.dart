import 'package:flutter_assignment/features/profile/data/models/user.dart';

abstract class UserRepository {

  Future<User?> getUser();
}