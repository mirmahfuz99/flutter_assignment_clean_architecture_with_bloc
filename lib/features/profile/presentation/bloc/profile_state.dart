import 'package:equatable/equatable.dart';
import 'package:flutter_assignment/features/profile/data/models/user.dart';
import 'package:flutter_assignment/features/profile/data/models/user_preferences.dart';

abstract class ProfileState extends Equatable {
  final UserPreferences? userPreferences;
  final User? user;

  const ProfileState({this.userPreferences, this.user});

  @override
  List<Object> get props => [ userPreferences ?? const UserPreferences(), user ?? const User()];
}

class ProfileLoading extends ProfileState {
  const ProfileLoading();
}

class ProfileLoaded extends ProfileState {
  const ProfileLoaded( UserPreferences userPreference, User user) : super(userPreferences: userPreference, user: user);
}