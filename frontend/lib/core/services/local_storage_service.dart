import 'package:shared_preferences/shared_preferences.dart';

enum PrefStringKey { accessToken, refreshToken, userId }

enum PrefBoolKey { isLoggedIn, hasSeenOnBoarding }

class LocalStorageService {
  static late SharedPreferences _pref;

  static Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
  }

  // Create
  static Future<void> setString(PrefStringKey key, String value) async {
    await _pref.setString(key.name, value);
  }

  static Future<void> setBoolean(PrefBoolKey key, bool value) async {
    await _pref.setBool(key.name, value);
  }

  // Read
  static String getString(PrefStringKey key) {
    return _pref.getString(key.name) ?? '';
  }

  static bool getBool(PrefBoolKey key) {
    return _pref.getBool(key.name) ?? false;
  }

  // Remove
  static Future<void> remove(PrefStringKey key, String value) async {
    await _pref.remove(key.name);
  }
}
