import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_online_learning/model/entity/author.dart';
import 'package:my_online_learning/remote/mapper/network_author_mapper.dart';
import 'package:my_online_learning/remote/source/author/author_service.dart';

@Injectable()
class AuthorRepository {
  final AuthorService _authorService;
  final NetworkAuthorMapper _mapper;

  AuthorRepository(this._authorService, this._mapper);

  Future<List<Author>> getAuthors() async {
    return <Author>[];
  }

  Future<Author> getAuthorDetail(String id) async {
    try {
      final authorResponse = await _authorService.getAuthorDetail(id);
      return _mapper.mapFromRemote(authorResponse.payload);
    } on DioError catch (e) {
      throw Exception(e.response.data["message"]);
    }
  }
}
