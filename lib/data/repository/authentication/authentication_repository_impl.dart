import 'package:my_online_learning/data/model/user.dart';
import 'package:my_online_learning/data/repository/authentication/authentication_data_source.dart';
import 'package:my_online_learning/data/repository/authentication/i_authentication_repository.dart';

class AuthenticationRepositoryImplement implements IAuthenticationRepository {
  final AuthenticationDataSource _authenticationDataSource;

  AuthenticationRepositoryImplement(this._authenticationDataSource);

  @override
  Future<bool> createNewPassword(String password) {
    return _authenticationDataSource.createNewPassword(password);
  }

  @override
  Future<bool> forgotPassword(String email) {
    return _authenticationDataSource.forgotPassword(email);
  }

  @override
  Future<bool> sendOTPCode(String opt) {
    return _authenticationDataSource.sendOTPCode(opt);
  }

  @override
  Future<bool> signIn(String userName, String password) {
    return _authenticationDataSource.signIn(userName, password);
  }

  @override
  Future<bool> signUp(User user, String password) {
    return _authenticationDataSource.signUp(user, password);
  }

  @override
  Future<bool> signInWithGoogle() {
    return _authenticationDataSource.signInWithGoogle();
  }
}
