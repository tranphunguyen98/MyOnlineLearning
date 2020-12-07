import 'package:my_online_learning/data/model/user.dart';
import 'package:my_online_learning/data/repository/authentication/authentication_data_source.dart';
import 'package:my_online_learning/data/repository/authentication/i_authentication_repository.dart';
import 'package:my_online_learning/remote/model/response.dart';

class AuthenticationRepositoryImplement implements IAuthenticationRepository {
  final AuthenticationDataSource _authenticationDataSource;

  AuthenticationRepositoryImplement(this._authenticationDataSource);

  @override
  Future<bool> createNewPassword(String email, String password) {
    return _authenticationDataSource.createNewPassword(email, password);
  }

  @override
  Future<bool> sendOTPCodeToEmail(String email) {
    return _authenticationDataSource.sendOTPCodeToEmail(email);
  }

  @override
  Future<bool> confirmOTPCode(String otpCode) {
    return _authenticationDataSource.confirmOTPCode(otpCode);
  }

  @override
  Future<User> signIn(String userName, String password) {
    return _authenticationDataSource.signIn(userName, password);
  }

  @override
  Future<MyResponse> signUp(User user) {
    return _authenticationDataSource.signUp(user);
  }

  @override
  Future<bool> signInWithGoogle() {
    return _authenticationDataSource.signInWithGoogle();
  }
}
