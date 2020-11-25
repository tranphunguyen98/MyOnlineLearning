import 'package:my_online_learning/data/model/user.dart';

abstract class IUserRepository {
  Future<bool> saveUser(User user);
  Future<User> getUser();
}
