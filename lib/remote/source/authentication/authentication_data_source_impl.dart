import 'package:my_online_learning/data/model/user.dart';
import 'package:my_online_learning/data/repository/authentication/authentication_data_source.dart';
import 'package:my_online_learning/remote/mapper/network_user_mapper.dart';
import 'package:my_online_learning/remote/model/response.dart';

import 'authentication_service.dart';

class AuthenticationDataSourceImplement implements AuthenticationDataSource {
  final AuthenticationService _authenticationService;
  final NetworkUserMapper _mapper;

  AuthenticationDataSourceImplement(this._authenticationService, this._mapper);

  @override
  Future<bool> createNewPassword(String email, String password) =>
      _authenticationService.createNewPassword(email, password);

  @override
  Future<bool> sendOTPCodeToEmail(String email) =>
      _authenticationService.sendOTPCodeToEmail(email);

  @override
  Future<bool> confirmOTPCode(String opt) =>
      _authenticationService.confirmOTPCode(opt);

  @override
  Future<User> signIn(String userName, String password) async => _mapper
      .mapFromRemote(await _authenticationService.signIn(userName, password));

  @override
  Future<MyResponse> signUp(User user) =>
      _authenticationService.signUp(_mapper.mapToRemote(user));

  @override
  Future<bool> signInWithGoogle() => _authenticationService.signInWithGoogle();
}
