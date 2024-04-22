import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? _prefs;
  static const _locale = 'locale';
  static const _ifRemember = 'ifRemember';
  static const _tokenKey = 'token';
  static const _nameKey = 'name';
  static const _emailKey = 'email';
  static const _roleKey = 'role';
  static const _theme = 'isDarkMode';

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static void saveLang(String languageCode) {
    _prefs?.setString(_locale, languageCode);
  }

  static String getLang() {
    final cachedLanguageCode = _prefs?.getString(_locale);
    if (cachedLanguageCode != null) {
      return cachedLanguageCode;
    } else {
      return "ar";
    }
  }

  static Future<bool?> saveIfRemember() async {
    try {
      return await _prefs?.setBool(_ifRemember, true);
    } catch (e) {
      return false;
    }
  }

  static bool getIfRemember() {
    try {
      return _prefs?.getBool(_ifRemember) ?? false;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> saveToken(String token) async {
    try {
      return await _prefs?.setString(_tokenKey, token) ?? false;
    } catch (e) {
      return false;
    }
  }

  static String getToken() {
    try {
      return _prefs?.getString(_tokenKey) ?? "";
    } catch (e) {
      return "";
    }
  }

  static Future<bool> saveName(String name) async {
    try {
      return await _prefs?.setString(_nameKey, name) ?? false;
    } catch (e) {
      return false;
    }
  }

  static String getName() {
    try {
      return _prefs?.getString(_nameKey) ?? "";
    } catch (e) {
      return "";
    }
  }

  static Future<bool> saveEmail(String email) async {
    try {
      return await _prefs?.setString(_emailKey, email) ?? false;
    } catch (e) {
      return false;
    }
  }

  static String getEmail() {
    try {
      return _prefs?.getString(_emailKey) ?? "";
    } catch (e) {
      return "";
    }
  }

  static Future<bool> saveRole(String role) async {
    try {
      return await _prefs?.setString(_roleKey, role) ?? false;
    } catch (e) {
      return false;
    }
  }

  static String getRole() {
    try {
      return _prefs?.getString(_roleKey) ?? "";
    } catch (e) {
      return "";
    }
  }

  static Future<bool> saveTheme(bool isDarkMode) async {
    try {
      return await _prefs?.setBool(_theme, isDarkMode) ?? false;
    } catch (e) {
      return false;
    }
  }

  static bool getTheme() {
    try {
      return _prefs?.getBool(_theme) ?? true;
    } catch (e) {
      return true;
    }
  }

  static Future<bool> clear() async {
    try {
      return await _prefs?.clear() ?? false;
    } catch (e) {
      return false;
    }
  }
}
