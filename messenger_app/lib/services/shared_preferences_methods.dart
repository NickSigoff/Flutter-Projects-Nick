import 'package:messenger_app/services/current_user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPreferencesMethods {
  static const String _sharedPreferencesNameKey = 'UserNameKey';
  static const String _sharedPreferencesEmailKey = 'UserEmailKey';
  static const String _sharedPreferencesIdKey = 'UserIdKey';

  ///set

  static Future<bool> setUserNameSharedPreferences(String name) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString(_sharedPreferencesNameKey, name);
  }

  static Future<bool> setUserEmailSharedPreferences(String email) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString(_sharedPreferencesEmailKey, email);
  }

  static Future<bool> setUserIdSharedPreferences(String id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString(_sharedPreferencesIdKey, id);
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

  static Future<bool> setCurrentsUser() async {
    await Future.delayed(const Duration(seconds: 1));
    CurrentUserData.currentUserName =
        await getUserNameSharedPreferences() ?? '';
    CurrentUserData.currentUserEmail =
        await getUserEmailSharedPreferences() ?? '';
    CurrentUserData.currentUserId = await getUserIdSharedPreferences() ?? '';
    await Future.delayed(const Duration(seconds: 1));
    return true;

  }
}
