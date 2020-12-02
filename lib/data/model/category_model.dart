import 'package:flutter/cupertino.dart';
import 'package:my_online_learning/model/entity/category.dart';

class CategoryModel extends ChangeNotifier {
  Category _category;

  set category(Category category) {
    _category = category;
    notifyListeners();
  }

  Category get category => _category;
}
