import 'package:messenger_app/services/current_user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const String _sharedPreferencesNameKey = 'UserNameKey';
  static const String _sharedPreferencesEmailKey = 'UserEmailKey';
  static const String _sharedPreferencesIdKey = 'UserIdKey';

  ///set

  Future<bool> setUserNameSharedPreferences(String name) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString(_sharedPreferencesNameKey, name);
  }

  Future<bool> setUserEmailSharedPreferences(String email) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString(_sharedPreferencesEmailKey, email);
  }

  Future<bool> setUserIdSharedPreferences(String id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString(_sharedPreferencesIdKey, id);
  }

  ///get
  Future<String?> getUserEmailSharedPreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_sharedPreferencesEmailKey);
  }

  Future<String?> getUserNameSharedPreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_sharedPreferencesNameKey);
  }

  Future<String?> getUserIdSharedPreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_sharedPreferencesIdKey);
  }

  Future<bool> setCurrentsUser() async {
    CurrentUserData.currentUserName =
        await getUserNameSharedPreferences() ?? '';
    CurrentUserData.currentUserEmail =
        await getUserEmailSharedPreferences() ?? '';
    CurrentUserData.currentUserId = await getUserIdSharedPreferences() ?? '';
    await Future.delayed(const Duration(milliseconds: 500));
    return true;
  }
}
