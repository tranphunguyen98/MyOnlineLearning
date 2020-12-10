import 'package:dio/dio.dart';
import 'package:my_online_learning/data/model/user.dart';
import 'package:my_online_learning/data/repository/user/cache_user_data_source.dart';
import 'package:my_online_learning/data/repository/user/i_user_repository.dart';
import 'package:my_online_learning/data/repository/user/remote_user_data_source.dart';

class UserRepositoryImplement implements IUserRepository {
  final CacheUserDataSource _cacheUserDataSource;
  final RemoteUserDataSource _remoteUserDataSource;

  UserRepositoryImplement(
      this._cacheUserDataSource, this._remoteUserDataSource);

  @override
  Future<bool> updateUser(User user) async {
    try {
      //await _cacheUserDataSource.saveUser(user);
      await _remoteUserDataSource.saveUser(user);
      return true;
    } on DioError catch (e) {
      throw Exception(e.response.data["message"]);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<User> getUser() async {
    return User.empty();
  }

  @override
  Future<void> removeUser() => _cacheUserDataSource.removeUser();
}
