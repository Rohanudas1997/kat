import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  saveFirstTimeLogin() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstTime', false);
  }

  getFirstTimeLogin() async{
    final prefs = await SharedPreferences.getInstance();
    final bool? isFirstTime = prefs.getBool('isFirstTime');
    return isFirstTime ?? true;
  }

  saveUser(bool hasUser) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasUser', hasUser);
  }

  getUser() async{
    final prefs = await SharedPreferences.getInstance();
    final bool? user = prefs.getBool('hasUser');
    return user;
  }
}
