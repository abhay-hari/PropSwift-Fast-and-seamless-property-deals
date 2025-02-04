import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:propswift/data/source/local/hive_database.dart/user_model.dart';

class SharedPreferce {
  static SharedPreferences? _prefs;
  static Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  static Future<void> saveUser(User user) async {
    await init();
    String userJson = jsonEncode(user.toJson());
    await _prefs!.setString('user', userJson);
  }

  static Future<User?> getUser() async {
    await init();
    String? userJson = _prefs!.getString('user');

    if (userJson != null) {
      Map<String, dynamic> userMap = jsonDecode(userJson);
      return User.fromJson(userMap);
    }
    return null;
  }

  static Future<void> removeUser() async {
    await init();
    await _prefs!.remove('user');
  }
}
