import 'package:my_online_learning/cache/model/cache_user.dart';
import 'package:my_online_learning/data/model/user.dart';

import 'cache_mapper.dart';

class CacheUserMapper implements CacheMapper<CacheUser, User> {
  @override
  User mapFromCache(CacheUser type) {
    return User(
      id: type.id,
      email: type.email,
      fullName: type.fullName,
      urlImage: type.urlImage,
      userName: type.userName,
    );
  }

  @override
  CacheUser mapToCache(User type) {
    return CacheUser(
      id: type.id,
      email: type.email,
      fullName: type.fullName,
      urlImage: type.urlImage,
      userName: type.userName,
    );
  }
}
