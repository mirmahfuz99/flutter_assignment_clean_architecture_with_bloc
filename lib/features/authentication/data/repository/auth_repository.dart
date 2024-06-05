
abstract class AuthRepository {

  Future<void> logIn({required String username, required String password});

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
    required String confirmPassword
  });

  Future<void> updateProfile({
    required String firstName,
    required String lastName,
  });

  void logOut();
}