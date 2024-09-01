

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences sharedPreferences;

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is String || value is bool || value is int || value is double) {
      return await sharedPreferences.setString(key, value.toString());
    } else {
      final jsonString = json.encode(value);
      return await sharedPreferences.setString(key, jsonString);
    }
  }


  static dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }
  static Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }
}
