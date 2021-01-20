import 'package:dio/dio.dart';
import 'package:my_online_learning/remote/model/network_user.dart';
import 'package:my_online_learning/remote/model/response/response.dart';
import 'package:my_online_learning/remote/model/response/user_response.dart';
import 'package:my_online_learning/remote/model/user_google.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'authentication_service.g.dart';

@RestApi(baseUrl: "http://api.dev.letstudy.org/")
abstract class AuthenticationService {
  factory AuthenticationService(Dio dio, {String baseUrl}) =
      _AuthenticationService;

  @POST("/user/login")
  Future<UserResponse> signIn(@Field() String email, @Field() String password);

  @POST("/user/login-google-mobile")
  Future<MessageResponse> signInWithGoogle(@Body() UserGoogle userGoogle);

  @POST("/user/register")
  Future<MessageResponse> signUp(@Body() NetworkUser user);

  @GET("/user/intro-page")
  Future<bool> confirmOTPCode(String optCode);

  @POST("/user/forget-pass/send-email")
  Future<MessageResponse> sendOTPCodeToEmail(@Field() String email);

  @GET("/user/intro-page")
  Future<bool> createNewPassword(String email, String password);

  @GET("/user/intro-page")
  Future<NetworkUser> loadUser();
}
