
abstract class AuthRepository {

  Future<void> logIn({required String username, required String password});

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
    required String confirmPassword
  });

  void logOut();
}