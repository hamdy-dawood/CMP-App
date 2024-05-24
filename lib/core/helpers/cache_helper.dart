import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? _prefs;
  static const _imageKey = 'image';
  static const _nameKey = 'name';
  static const _emailKey = 'email';
  static const _idKey = 'id';

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> saveImage(String token) async {
    try {
      return await _prefs?.setString(_imageKey, token) ?? false;
    } catch (e) {
      return false;
    }
  }

  static String getImage() {
    try {
      return _prefs?.getString(_imageKey) ?? "";
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

  static Future<void> saveId(String id) async => _prefs?.setString(_idKey, id);

  static String getId() => _prefs?.getString(_idKey) ?? "";


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

  static Future<bool> clear() async {
    try {
      return await _prefs?.clear() ?? false;
    } catch (e) {
      return false;
    }
  }
}
