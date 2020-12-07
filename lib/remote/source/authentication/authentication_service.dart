import 'package:dio/dio.dart';
import 'package:my_online_learning/remote/model/network_user.dart';
import 'package:my_online_learning/remote/model/response.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'authentication_service.g.dart';

@RestApi(baseUrl: "http://api.dev.letstudy.org/")
abstract class AuthenticationService {
  factory AuthenticationService(Dio dio, {String baseUrl}) =
      _AuthenticationService;

  @GET("/user/intro-page")
  Future<NetworkUser> signIn(String userName, String password);

  @GET("/user/intro-page")
  Future<bool> signInWithGoogle();

  @POST("/user/register")
  Future<MyResponse> signUp(@Body() NetworkUser user);

  @GET("/user/intro-page")
  Future<bool> confirmOTPCode(String optCode);

  @GET("/user/intro-page")
  Future<bool> sendOTPCodeToEmail(String email);

  @GET("/user/intro-page")
  Future<bool> createNewPassword(String email, String password);

  @GET("/user/intro-page")
  Future<NetworkUser> loadUser();
}
