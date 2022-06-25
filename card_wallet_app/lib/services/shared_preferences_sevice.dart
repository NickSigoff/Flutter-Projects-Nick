import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final String _currentUserKey = 'currentUserKey';

  ///Users map
  Future<bool> setUserInfoSharedPreferences(String userJson, String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString(key, userJson);
  }

  Future<String?> getUserInfoSharedPreferences(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key);
  }

  ///Current User
  Future<bool> setCurrentUserSharedPreferences(
      String userJson) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString(_currentUserKey, userJson);
  }

  Future<String?> getCurrentUserSharedPreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_currentUserKey);
  }
}
