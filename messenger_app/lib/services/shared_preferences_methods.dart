import 'package:messenger_app/services/current_user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPreferencesMethods {
  static const String _sharedPreferencesUserLoggedInKey = 'IsLoggedIn';
  static const String _sharedPreferencesNameKey = 'UserNameKey';
  static const String _sharedPreferencesEmailKey = 'UserEmailKey';
  static const String _sharedPreferencesIdKey = 'UserIdKey';

  ///set
  static Future<bool> setUserLoggedInSharedPreferences(
      bool isUserLoggedIn) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setBool(
        _sharedPreferencesUserLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> setUserNameSharedPreferences(String name) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    CurrentUserData.currentUserName = name;
    return sharedPreferences.setString(_sharedPreferencesNameKey, name);
  }

  static Future<bool> setUserEmailSharedPreferences(String email) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    CurrentUserData.currentUserEmail = email;
    return sharedPreferences.setString(_sharedPreferencesEmailKey, email);
  }

  static Future<bool> setUserIdSharedPreferences(String id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    CurrentUserData.currentUserId = id;
    return sharedPreferences.setString(_sharedPreferencesIdKey, id);
  }

  ///get
  static Future<String?> getUserEmailSharedPreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_sharedPreferencesEmailKey);
  }

  static Future<String?> getUserNameSharedPreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_sharedPreferencesNameKey);
  }

  static Future<String?> getUserIdSharedPreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_sharedPreferencesIdKey);
  }

  static Future<bool?> getUserIsLoggedSharedPreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(_sharedPreferencesUserLoggedInKey);
  }
}
