import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:my_online_learning/remote/model/network_user.dart';
import 'package:supercharged/supercharged.dart';

class AuthenticationService {
  Future<NetworkUser> signIn(String userName, String password) {
    return Future.delayed(
      500.milliseconds,
      () {
        if ((userName == 'user' && password == '1234')) {
          return loadUser();
        } else {
          throw Exception("Invalid username or password");
        }
      },
    );
  }

  Future<bool> signInWithGoogle() {
    return Future.delayed(
      500.milliseconds,
      () {
        return true;
      },
    );
  }

  Future<bool> signUp(NetworkUser user, String password) {
    return Future.delayed(500.milliseconds, () {
      if (user.userName != 'user') {
        return true;
      }
      throw Exception("User name is existed");
    });
  }

  Future<bool> confirmOTPCode(String optCode) {
    return Future.delayed(
      500.milliseconds,
      () {
        if (optCode == '111111') {
          return true;
        } else {
          throw Exception("OTP Code is not correct");
        }
      },
    );
  }

  Future<bool> sendOTPCodeToEmail(String email) {
    return Future.delayed(
      500.milliseconds,
      () {
        return true;
      },
    );
  }

  Future<bool> createNewPassword(String email, String password) {
    return Future.delayed(
      500.milliseconds,
      () {
        return true;
      },
    );
  }

  Future<NetworkUser> loadUser() async {
    // Đọc file json dưới dạng chuỗi
    String jsonString = await rootBundle.loadString('sample_data/user.json');
    // Giải mã file json sang Map
    Map<String, dynamic> jsonMap =
        json.decode(jsonString) as Map<String, dynamic>;

    return NetworkUser.fromJson(jsonMap);
  }
}
