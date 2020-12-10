import 'package:my_online_learning/data/model/user.dart';

abstract class IUserRepository {
  Future<bool> updateUser(User user);
  Future<User> getUser();
  Future<void> removeUser();
}
