import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences? prefs;

  Future<SharedPreferences> getPref() async {
    prefs ??= await SharedPreferences.getInstance();
    return prefs!;
  }

  Future<String?> getString(key) async {
    return (await getPref()).getString(key);
  }

  Future<bool> setString(key, value) async {
    return (await getPref()).setString(key, value);
  }

  Future<bool> deleteKey(key) async {
    return (await getPref()).remove(key);
  }

  Future<int> getInt(key) async {
    return (await getPref()).getInt(key) ?? 0;
  }

  Future<bool> setInt(key, value) async {
    return (await getPref()).setInt(key, value);
  }

  Future<double> getDouble(key) async {
    return (await getPref()).getDouble(key) ?? 0;
  }

  Future<bool> setDouble(key, value) async {
    return (await getPref()).setDouble(key, value);
  }

  Future<bool> getBool(key) async {
    return (await getPref()).getBool(key) ?? false;
  }

  Future<bool> setBool(key, value) async {
    return (await getPref()).setBool(key, value);
  }

  Future<bool> clearSharedStorage() async {
    return (await getPref()).clear();
  }
}
