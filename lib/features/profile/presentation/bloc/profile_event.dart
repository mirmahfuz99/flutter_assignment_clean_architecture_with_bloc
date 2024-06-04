import 'package:equatable/equatable.dart';
import 'package:flutter_assignment/features/profile/data/models/user.dart';

abstract class ProfileEvent extends Equatable {
  final User ? user;

  const ProfileEvent({this.user});

  @override
  List<Object> get props => [user!];
}


class GetUser extends ProfileEvent {
  const GetUser();
}
