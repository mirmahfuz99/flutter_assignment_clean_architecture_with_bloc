class Images {
  static String get logo => 'dokan_logo'.png;
  static String get camera => 'camera'.png;
  static String get closeEye => 'close_eye'.png;
  static String get email => 'email'.png;
  static String get facebook => 'facebook'.png;
  static String get google => 'google'.png;
  static String get name => 'name'.png;
  static String get password => 'password'.png;

}

extension on String {
  String get png => 'assets/images/$this.png';
}
