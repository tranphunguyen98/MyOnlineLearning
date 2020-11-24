import 'package:my_online_learning/data/model/user.dart';

abstract class IAuthenticationRepository {
  Future<bool> signIn(String userName, String password);
  Future<bool> signUp(User user, String password);
  Future<bool> forgotPassword(String email);
  Future<bool> sendOTPCode(String opt);
  Future<bool> createNewPassword(String password);
}
