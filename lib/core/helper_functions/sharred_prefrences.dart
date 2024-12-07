import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  // Singleton لتسهيل التعامل مع SharedPreferences
  static final SharedPreferencesHelper _instance =
      SharedPreferencesHelper._internal();

  factory SharedPreferencesHelper() {
    return _instance;
  }

  SharedPreferencesHelper._internal();

  // جلب SharedPreferences Instance
  Future<SharedPreferences> _getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  /// حفظ البيانات من أي نوع (String, int, bool, double, List<String>)
  Future<void> saveData<T>(String key, T value) async {
    final prefs = await _getPrefs();

    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else if (value is List<String>) {
      await prefs.setStringList(key, value);
    } else {
      throw Exception("Unsupported data type");
    }
  }

  /// جلب البيانات من أي نوع (String, int, bool, double, List<String>)
  Future<T?> getData<T>(String key) async {
    final prefs = await _getPrefs();

    if (T == String) {
      return prefs.getString(key) as T?;
    } else if (T == int) {
      return prefs.getInt(key) as T?;
    } else if (T == bool) {
      return prefs.getBool(key) as T?;
    } else if (T == double) {
      return prefs.getDouble(key) as T?;
    } else if (T == List<String>) {
      return prefs.getStringList(key) as T?;
    } else {
      throw Exception("Unsupported data type");
    }
  }

  /// حذف بيانات معينة
  Future<void> removeData(String key) async {
    final prefs = await _getPrefs();
    await prefs.remove(key);
  }

  /// مسح جميع البيانات
  Future<void> clearAll() async {
    final prefs = await _getPrefs();
    await prefs.clear();
  }
}
