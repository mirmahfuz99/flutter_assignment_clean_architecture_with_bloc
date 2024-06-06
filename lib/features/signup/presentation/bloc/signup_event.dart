part of 'signup_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

final class SignUpUserNameChanged extends SignUpEvent {
  const SignUpUserNameChanged(this.name);

  final String name;

  @override
  List<Object> get props => [name];
}

final class SignUpEmailChanged extends SignUpEvent {
  const SignUpEmailChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

final class SignUpPasswordChanged extends SignUpEvent {
  const SignUpPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

final class SignUpConfirmPasswordChanged extends SignUpEvent {
  const SignUpConfirmPasswordChanged(this.confirmPassword);

  final String confirmPassword;

  @override
  List<Object> get props => [confirmPassword];
}

final class SignUpSubmitted extends SignUpEvent {
  const SignUpSubmitted();
}