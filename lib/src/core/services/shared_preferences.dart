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

  // Add more methods as needed...
}
