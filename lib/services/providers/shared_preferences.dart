import 'package:shared_preferences/shared_preferences.dart';

class AuthUserData {
  static SharedPreferences _preferences = SharedPreferences.getInstance() as SharedPreferences;
  static const _keyAuth = 'false';

  static Future init() async => _preferences = await SharedPreferences.getInstance();

  static Future setAuthBool(bool appEntry) async {
    await _preferences.setBool(_keyAuth, appEntry);
  }
  static getAuthBool() => _preferences.getBool(_keyAuth);
}

class UserData {
  static SharedPreferences _preferences = SharedPreferences.getInstance() as SharedPreferences;
  static Future init() async => _preferences = await SharedPreferences.getInstance();

  static Future setUserData(
      String uid,
      ) async {
    await _preferences.setStringList('UserData', [
      uid,

    ]);
  }
  static getUserData() => _preferences.getStringList('UserData') ?? [];
}
