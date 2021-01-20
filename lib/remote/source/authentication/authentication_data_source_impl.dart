import 'package:dio/dio.dart';
import 'package:my_online_learning/data/model/user.dart';
import 'package:my_online_learning/data/repository/authentication/authentication_data_source.dart';
import 'package:my_online_learning/remote/mapper/network_user_mapper.dart';
import 'package:my_online_learning/remote/model/response/response.dart';
import 'package:my_online_learning/remote/model/user_google.dart';

import 'authentication_service.dart';

class AuthenticationDataSourceImplement implements AuthenticationDataSource {
  final AuthenticationService _authenticationService;
  final NetworkUserMapper _mapper;

  AuthenticationDataSourceImplement(this._authenticationService, this._mapper);

  @override
  Future<bool> createNewPassword(String email, String password) =>
      _authenticationService.createNewPassword(email, password);

  @override
  Future<bool> sendOTPCodeToEmail(String email) async {
    try {
      final messageResponse =
          await _authenticationService.sendOTPCodeToEmail(email);
      return true;
    } on DioError catch (e) {
      throw Exception(e.response.data["message"]);
    }
  }

  @override
  Future<bool> confirmOTPCode(String opt) =>
      _authenticationService.confirmOTPCode(opt);

  @override
  Future<User> signIn(String userName, String password) async {
    try {
      final userResponse =
          await _authenticationService.signIn(userName, password);
      print(userResponse.userInfoWithToken.toString());
      return _mapper.mapFromRemote(userResponse.userInfoWithToken);
    } on DioError catch (e) {
      throw Exception(e.response.data["message"]);
    }
  }

  @override
  Future<MessageResponse> signUp(User user) =>
      _authenticationService.signUp(_mapper.mapToRemote(user));

  @override
  Future<bool> signInWithGoogle(UserGoogle userGoogle) async {
    try {
      final messageResponse =
          await _authenticationService.signInWithGoogle(userGoogle);
      return true;
    } on DioError catch (e) {
      throw Exception(e.response.data["message"]);
    }
  }
}
