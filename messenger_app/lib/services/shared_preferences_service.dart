import 'dart:convert';

import 'package:messenger_app/models/user_model.dart';
import 'package:messenger_app/services/current_user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const String _sharedPreferencesUserInfo = 'UserInfoKey';

  ///User info
  Future<bool> setUserInfoSharedPreferences(String userInfo) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString(
        _sharedPreferencesUserInfo, userInfo);
  }

  Future<String?> getUserInfoSharedPreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_sharedPreferencesUserInfo);
  }

  ///Draft
  Future<bool> setUserSharedPreferencesDraft(
      {required String value, required String key}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString(key, value);
  }

  Future<String?> getUserSharedPreferencesDraft(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key);
  }
}
