

class APIPathHelper {
  // global api base url
  static const String baseUrl = "https://apptest.dokandemo.com";

  static String login({String? userName, String? password}) {
        return "/wp-json/jwt-auth/v1/token?username=$userName&password=$password";
  }

  static String signup() {
        return "/wp-json/wp/v2/users/register";
  }


  static String updateProfile({String? firstName, String? lastName}) {
    return "/wp-json/wp/v2/users/me?first_name=$firstName&last_name=$lastName";
  }
}
