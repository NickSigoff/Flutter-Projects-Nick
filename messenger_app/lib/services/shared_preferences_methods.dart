import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPreferencesMethods {
  static String sharedPreferencesUserLoggedInKey = 'IsLoggedIn';
  static String sharedPreferencesNameKey = 'UserNameKey';
  static String sharedPreferencesEmailKey = 'UserEmailKey';

  static Future<bool> setUserLoggedInSharedPreferences(
      bool isUserLoggedIn) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setBool(
        sharedPreferencesUserLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> setUserNameSharedPreferences(String name) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString(sharedPreferencesNameKey, name);
  }

  static Future<bool> setUserEmailSharedPreferences(String email) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString(sharedPreferencesEmailKey, email);
  }

  static Future<bool?> getUserEmailSharedPreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(sharedPreferencesEmailKey);
  }

  static Future<bool?> getUserNameSharedPreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(sharedPreferencesNameKey);
  }

  static Future<bool?> getUserIsLoggedSharedPreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(sharedPreferencesUserLoggedInKey);
  }
}
