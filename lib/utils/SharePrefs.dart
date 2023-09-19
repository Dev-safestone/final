import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences {
  static SharedPreferences? _preferences;

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setisLoggedIn(bool flag) async =>
      await _preferences!.setBool('isLoggedIn', flag);

  static bool? getisLoggedIn() => _preferences!.getBool('isLoggedIn');

  static Future setUsername(String flag) async =>
      await _preferences!.setString('user', flag);

  static String? getUsername() => _preferences!.getString('user');

  static String? getName() {}

  static String? getUserId() {}

  static String? getConfirmPassword() {}

  static String? getPassword() {}

  static String? getGender() {}

  static String? getAge() {}

  static String? getCity() {}
}
