import 'package:my_online_learning/data/model/user.dart';
import 'package:my_online_learning/data/repository/user/remote_user_data_source.dart';
import 'package:my_online_learning/remote/mapper/network_user_mapper.dart';
import 'package:my_online_learning/remote/model/response/response.dart';
import 'package:my_online_learning/remote/source/user/user_service.dart';

class RemoteUserDataSourceImplement implements RemoteUserDataSource {
  final UserService _userService;
  final NetworkUserMapper _mapper;

  RemoteUserDataSourceImplement(this._userService, this._mapper);

  @override
  Future<MessageResponse> saveUser(User user) async {
    print("Bearer ${user.token}");
    return _userService.updateProfile(
        "Bearer ${user.token}", _mapper.mapToRemote(user));
  }

  @override
  Future<User> getUser() async {
    return User.empty();
  }

  @override
  Future<void> removeUser() async {}
}
