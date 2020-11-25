import 'package:flutter/cupertino.dart';
import 'package:my_online_learning/data/model/user.dart';

class UserModel extends ChangeNotifier {
  User _user;

  set user(User user) {
    _user = user;
    notifyListeners();
  }

  User get user => _user;
}
