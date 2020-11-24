import 'package:my_online_learning/data/model/user.dart';
import 'package:my_online_learning/data/repository/authentication/authentication_data_source.dart';
import 'package:my_online_learning/remote/mapper/network_user_mapper.dart';

import 'authentication_service.dart';

class AuthenticationDataSourceImplement implements AuthenticationDataSource {
  final AuthenticationService _authenticationService;
  final NetworkUserMapper _mapper;
  AuthenticationDataSourceImplement(this._authenticationService, this._mapper);

  @override
  Future<bool> createNewPassword(String email, String password) {
    return _authenticationService.createNewPassword(email, password);
  }

  @override
  Future<bool> sendOTPCodeToEmail(String email) {
    return _authenticationService.sendOTPCodeToEmail(email);
  }

  @override
  Future<bool> confirmOTPCode(String opt) {
    return _authenticationService.confirmOTPCode(opt);
  }

  @override
  Future<bool> signIn(String userName, String password) {
    return _authenticationService.signIn(userName, password);
  }

  @override
  Future<bool> signUp(User user, String password) {
    return _authenticationService.signUp(_mapper.mapToRemote(user), password);
  }

  @override
  Future<bool> signInWithGoogle() {
    return _authenticationService.signInWithGoogle();
  }
}
