import 'package:equatable/equatable.dart';
import 'package:flutter_assignment/features/profile/data/models/user.dart';

abstract class ProfileState extends Equatable {
  final User? user;

  const ProfileState({this.user});

  @override
  List<Object> get props => [user ?? const User()];
}

class ProfileLoading extends ProfileState {
  const ProfileLoading();
}

class ProfileLoaded extends ProfileState {
  const ProfileLoaded( User user) : super(user: user);
}