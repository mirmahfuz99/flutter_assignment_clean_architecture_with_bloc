part of 'signup_bloc.dart';

final class SignUpState extends Equatable {
  const SignUpState({
    this.status = FormzSubmissionStatus.initial,
    this.name = const Name.pure(),
    this.username = const Username.pure(),
    this.password = const Password.pure(),
    this.confirmPassword = const Password.pure(),
    this.isValid = false,
  });

  final FormzSubmissionStatus status;
  final Name name;
  final Username username;
  final Password password;
  final Password confirmPassword;
  final bool isValid;

  SignUpState copyWith({
    FormzSubmissionStatus? status,
    Name? name,
    Username? username,
    Password? password,
    Password? confirmPassword,
    bool? isValid,
  }) {
    return SignUpState(
      status: status ?? this.status,
      name: name ?? this.name,
      username: username ?? this.username,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [status, name, username, password];
}