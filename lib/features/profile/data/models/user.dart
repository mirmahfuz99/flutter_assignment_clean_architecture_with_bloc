import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User(this.userEmail, this.userDisplayName);

  final String userEmail;
  final String userDisplayName;

  @override
  List<Object> get props => [userEmail, userDisplayName];

  static const empty = User('-','-');
}