import 'package:injectable/injectable.dart';
import 'package:my_online_learning/data/model/user.dart';
import 'package:my_online_learning/remote/mapper/network_mapper.dart';
import 'package:my_online_learning/remote/model/network_user.dart';

@Injectable()
class NetworkUserMapper implements NetworkMapper<NetworkUser, User> {
  @override
  User mapFromRemote(NetworkUser type) {
    return User(
        token: type.token,
        id: type.id,
        email: type.email,
        phone: type.phone,
        avatar: type.avatar,
        name: type.username,
        password: type.password);
  }

  @override
  NetworkUser mapToRemote(User type) {
    return NetworkUser(
        token: type.token,
        id: type.id,
        email: type.email,
        phone: type.phone,
        avatar: type.avatar,
        username: type.name,
        password: type.password);
  }
}
