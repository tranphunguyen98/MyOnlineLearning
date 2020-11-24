import 'package:my_online_learning/remote/model/network_user.dart';
import 'package:supercharged/supercharged.dart';

class AuthenticationService {
  Future<bool> signIn(String userName, String password) {
    return Future.delayed(
      500.milliseconds,
      () {
        if ((userName == 'user' && password == '1234')) {
          return true;
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
    return Future.delayed(500.milliseconds, () => true);
  }
}
