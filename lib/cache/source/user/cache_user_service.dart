import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:my_online_learning/cache/model/cache_user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supercharged/supercharged.dart';

@Injectable()
class CacheUserService {
  final String USER_KEY = "user";

  Future<bool> saveUser(CacheUser user) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String userString = json.encode(user.toJson());
      await prefs.setString(USER_KEY, userString);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<CacheUser> getUser() {
    return Future.delayed(500.milliseconds, () async {
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final userString = prefs.getString(USER_KEY);
        if (userString != null) {
          return CacheUser.fromJson(
              json.decode(userString) as Map<String, dynamic>);
        } else {
          return CacheUser();
        }
      } catch (e) {
        rethrow;
      }
    });
  }

  Future<void> clearUser() {
    return Future.delayed(500.milliseconds, () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove(USER_KEY);
    });
  }
}
