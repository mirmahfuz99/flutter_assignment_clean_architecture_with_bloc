class Images {
  static const String placeholder = 'assets/images/placeholder.png';

  static String get logo => 'dokan_logo'.png;
  static String get splashLogo => 'splash_logo'.png;
  static String get camera => 'camera'.png;
  static String get closeEye => 'close_eye'.png;
  static String get email => 'email'.png;
  static String get facebook => 'facebook'.png;
  static String get google => 'google'.png;
  static String get name => 'name'.png;
  static String get password => 'password'.png;




  static String get cart => 'cart'.png;
  static String get category => 'category'.png;
  static String get wishlist => 'heart'.png;
  static String get home => 'home'.png;
  static String get notification => 'notification'.png;
  static String get profileDummyImage => 'profile_dummy_image'.png;
  static String get search => 'search'.png;

  static String get filter => 'filter'.png;
  static String get menu => 'menu'.png;

}

extension on String {
  String get png => 'assets/images/$this.png';
}
