import 'package:dio/dio.dart';
import 'package:my_online_learning/remote/model/response/author_response.dart';
import 'package:my_online_learning/remote/model/response/list_author_response.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'author_service.g.dart';

@RestApi(baseUrl: "http://api.dev.letstudy.org/")
abstract class AuthorService {
  factory AuthorService(Dio dio, {String baseUrl}) = _AuthorService;

  @GET("/instructor")
  Future<ListAuthorResponse> getAuthors();

  @GET("/instructor/detail/{id}")
  Future<AuthorResponse> getAuthorDetail(@Path("id") String id);
}
