import 'package:dio/dio.dart';
import 'package:my_online_learning/remote/model/network_user.dart';
import 'package:my_online_learning/remote/model/response/response.dart';
import 'package:retrofit/retrofit.dart';

part 'user_service.g.dart';

@RestApi(baseUrl: "http://api.dev.letstudy.org/")
abstract class UserService {
  factory UserService(Dio dio, {String baseUrl}) = _UserService;

  @PUT("/user/update-profile")
  Future<MessageResponse> updateProfile(
      @Header("token") String token, @Body() NetworkUser user);
}
