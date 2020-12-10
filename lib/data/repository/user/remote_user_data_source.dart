import 'package:my_online_learning/data/model/user.dart';
import 'package:my_online_learning/remote/model/response/response.dart';

abstract class RemoteUserDataSource {
  Future<MessageResponse> saveUser(User user);
  Future<User> getUser();
  Future<void> removeUser();
}
