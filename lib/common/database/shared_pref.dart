import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const firstTimeAppOpen = 'FirstTimeAppOpen';

  static Future setFirstTimeAppOpen(bool status) async {
    final _instance = await SharedPreferences.getInstance();
    await _instance.setBool(firstTimeAppOpen, status);
  }

  static Future<bool> getFirstTimeAppOpen() async {
    final _instance = await SharedPreferences.getInstance();
    final res = _instance.getBool(firstTimeAppOpen);
    if (res == null) return true;
    return res;
  }
}
