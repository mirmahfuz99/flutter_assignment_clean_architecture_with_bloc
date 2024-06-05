part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.user = const UserPreferences(),
  });

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(UserPreferences userPreferences)
      : this._(status: AuthenticationStatus.authenticated, user: userPreferences);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  const AuthenticationState.registered()
      : this._(status: AuthenticationStatus.registered);

  final AuthenticationStatus status;
  final UserPreferences user;

  @override
  List<Object> get props => [status, user];
}