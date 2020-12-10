import 'package:injectable/injectable.dart';
import 'package:my_online_learning/cache/model/cache_user.dart';
import 'package:my_online_learning/data/model/user.dart';

import 'cache_mapper.dart';

@Injectable()
class CacheUserMapper implements CacheMapper<CacheUser, User> {
  @override
  User mapFromCache(CacheUser type) {
    return User(
      id: type.id,
      email: type.email,
      phone: type.fullName,
      avatar: type.urlImage,
      name: type.userName,
    );
  }

  @override
  CacheUser mapToCache(User type) {
    return CacheUser(
      id: type.id,
      email: type.email,
      fullName: type.phone,
      urlImage: type.avatar,
      userName: type.name,
    );
  }
}
