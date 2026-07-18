import 'package:shared_preferences/shared_preferences.dart';

class HelperFunction {
  static String mail = 'mail';
  static String password = 'password';
  static String isloggedin = 'isloggedin';

  //Saving
  static Future<bool> setMailSP(String name) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(mail, name);
  }

  static Future<bool> setPasswordSP(String name) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(password, name);
  }

  static Future<bool> setIsLoggedIn(bool name) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(isloggedin, name);
  }

  //Getting
  static Future<String?> getMailSP() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(mail);
  }

  static Future<String?> getPasswordSP() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    return preference.getString(password);
  }

  static Future<bool?> getIsLoggedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(isloggedin);
  }

  //Clear
  static Future<bool?> clearMailSP() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.remove(mail);
  }

  static Future<bool?> clearPasswordSP() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.remove(password);
  }

  static Future<bool?> clearIsLoggedInSP() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.remove(isloggedin);
  }
}
