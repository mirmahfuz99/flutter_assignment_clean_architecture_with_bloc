

class APIPathHelper {
  // global api base url
  static const String baseUrl = "https://apptest.dokandemo.com/wp-json/jwt-auth/v1";

  static String login({String? userName, String? password}) {
        return "/token?username=$userName&password=$password";
  }
}
