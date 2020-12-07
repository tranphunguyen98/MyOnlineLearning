import 'package:my_online_learning/data/model/user.dart';
import 'package:my_online_learning/remote/model/response.dart';

abstract class IAuthenticationRepository {
  Future<User> signIn(String userName, String password);
  Future<bool> signInWithGoogle();
  Future<MyResponse> signUp(User user);
  Future<bool> sendOTPCodeToEmail(String email);
  Future<bool> confirmOTPCode(String otpCode);
  Future<bool> createNewPassword(String email, String password);
}
