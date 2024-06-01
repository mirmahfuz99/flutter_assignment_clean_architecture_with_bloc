
abstract class AuthRepository {

  Future<void> logIn({required String username, required String password});

  void logOut();
}