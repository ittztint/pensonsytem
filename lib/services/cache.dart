import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';


class SessionManager {
  Future<SharedPreferences> _getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  Future<String?> getString(String key) async {
    return await _getPrefs().then((pref) {
      return pref.getString(key);
    });
  }

  void saveString(String key, String value) async {
    await _getPrefs().then((pref) {
      pref.setString(key, value);
    });
  }

}
