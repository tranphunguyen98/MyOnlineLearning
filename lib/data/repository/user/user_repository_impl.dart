import 'package:my_online_learning/data/model/user.dart';
import 'package:my_online_learning/data/repository/user/i_user_repository.dart';
import 'package:my_online_learning/data/repository/user/user_data_source.dart';

class UserRepositoryImplement implements IUserRepository {
  final CacheUserDataSource _userDataSource;

  UserRepositoryImplement(this._userDataSource);

  @override
  Future<bool> saveUser(User user) {
    return _userDataSource.saveUser(user);
  }

  @override
  Future<User> getUser() {
    return _userDataSource.getUser();
  }

  @override
  Future<void> removeUser() => _userDataSource.removeUser();
}
