import 'package:my_online_learning/data/model/user.dart';
import 'package:my_online_learning/remote/mapper/network_mapper.dart';
import 'package:my_online_learning/remote/model/network_user.dart';

class NetworkUserMapper implements NetworkMapper<NetworkUser, User> {
  @override
  User mapFromRemote(NetworkUser type) {
    return User(
      id: type.id,
      email: type.email,
      fullName: type.fullName,
      urlImage: type.urlImage,
      userName: type.userName,
    );
  }

  @override
  NetworkUser mapToRemote(User type) {
    return NetworkUser(
      id: type.id,
      email: type.email,
      fullName: type.fullName,
      urlImage: type.urlImage,
      userName: type.userName,
    );
  }
}
