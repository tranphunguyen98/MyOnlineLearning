import 'package:my_online_learning/data/model/user.dart';

abstract class AuthenticationDataSource {
  Future<bool> signIn(String userName, String password);
  Future<bool> signInWithGoogle();
  Future<bool> signUp(User user, String password);
  Future<bool> sendOTPCodeToEmail(String email);
  Future<bool> confirmOTPCode(String opt);
  Future<bool> createNewPassword(String email, String password);
}
