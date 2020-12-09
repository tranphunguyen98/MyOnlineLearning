import 'package:my_online_learning/data/model/user.dart';
import 'package:my_online_learning/remote/model/response/response.dart';

abstract class IAuthenticationRepository {
  Future<User> signIn(String userName, String password);
  Future<bool> signInWithGoogle();
  Future<MessageResponse> signUp(User user);
  Future<bool> sendEmailResetPassword(String email);
  Future<bool> confirmOTPCode(String otpCode);
  Future<bool> createNewPassword(String email, String password);
}
