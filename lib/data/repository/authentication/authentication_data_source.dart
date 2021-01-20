import 'package:my_online_learning/data/model/user.dart';
import 'package:my_online_learning/remote/model/response/response.dart';
import 'package:my_online_learning/remote/model/user_google.dart';

abstract class AuthenticationDataSource {
  Future<User> signIn(String userName, String password);
  Future<bool> signInWithGoogle(UserGoogle userGoogle);
  Future<MessageResponse> signUp(User user);
  Future<bool> sendOTPCodeToEmail(String email);
  Future<bool> confirmOTPCode(String opt);
  Future<bool> createNewPassword(String email, String password);
}
