import 'package:flutter/cupertino.dart';

class LinkVideoPlay extends ChangeNotifier {
  String _link = "";

  String get link => _link;

  LinkVideoPlay(this._link);

  set link(String link) {
    _link = link;
    print("notifierrrrrrrrrrr");
    notifyListeners();
  }
}
