import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final SharedPreferences _preferences;

  SharedPreferencesService(this._preferences);

  Future setString(String key, String value) async =>
      await _preferences.setString(key, value);

  String? getString(String key) => _preferences.getString(key);

  Future setBool(String key, bool value) async =>
      await _preferences.setBool(key, value);

  bool? getBool(String key) => _preferences.getBool(key);

  // Save DateTime
  Future<void> saveDateTime(
      {required String key, required DateTime dateTime}) async {
    await _preferences.setString(key, dateTime.toIso8601String());
  }

// Retrieve DateTime
  Future<DateTime?> getDateTime({required String key}) async {
    String? dateTimeString = _preferences.getString(key);
    if (dateTimeString != null) {
      return DateTime.parse(dateTimeString);
    }
    return null;
  }
}
