import 'dart:convert';

import 'package:my_online_learning/cache/model/cache_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheUserService {
  final String USER_KEY = "user";
  Future<bool> saveUser(CacheUser user) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String userString = json.encode(user.toJson());
      prefs.setString(USER_KEY, userString);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<CacheUser> getUser() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final userString = prefs.getString(USER_KEY);
      return CacheUser.fromJson(
          json.decode(userString) as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }
}
