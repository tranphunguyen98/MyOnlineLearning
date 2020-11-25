import 'package:my_online_learning/cache/mapper/cache_user_mapper.dart';
import 'package:my_online_learning/data/model/user.dart';
import 'package:my_online_learning/data/repository/user/user_data_source.dart';

import 'cache_user_service.dart';

class CacheUserDataSourceImplement implements CacheUserDataSource {
  final CacheUserService _userService;
  final CacheUserMapper _mapper;

  CacheUserDataSourceImplement(this._userService, this._mapper);

  @override
  Future<bool> saveUser(User user) {
    return _userService.saveUser(_mapper.mapToCache(user));
  }

  @override
  Future<User> getUser() async {
    return _mapper.mapFromCache(await _userService.getUser());
  }
}
