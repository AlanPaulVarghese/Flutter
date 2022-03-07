import 'package:shared_preferences/shared_preferences.dart';

class Settings {
  static late SharedPreferences prefs;
  static Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future setName(String name) async {
    await prefs.setString('name', name);
  }

  static Future setEmail(String email) async {
    await prefs.setString('email', email);
  }

  static String? getName() {
    return prefs.getString('name') ?? 'User';
  }

  static String? getEmail() {
    return prefs.getString('email') ?? 'user000@gmail.com';
  }

  static Future setPhone(int phone) async {
    await prefs.setInt('phone', phone);
  }

  static int? getPhone() {
    return prefs.getInt('phone') ?? 900000000;
  }

  static Future setDarkMode(bool darkMode) async {
    await prefs.setBool('darkMode', darkMode);
  }

  static bool? getDarkMode() {
    return prefs.getBool('darkMode') ?? false;
  }
}
