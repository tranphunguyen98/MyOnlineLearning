import 'package:injectable/injectable.dart';
import 'package:my_online_learning/model/entity/category.dart';
import 'package:my_online_learning/remote/mapper/network_mapper.dart';
import 'package:my_online_learning/remote/model/network_category.dart';

@Injectable()
class NetworkCategoryMapper
    implements NetworkMapper<NetworkCategory, Category> {
  @override
  Category mapFromRemote(NetworkCategory type) {
    return Category(
        id: type.id,
        courses: [],
        title: type.name,
        image: "images/background_category_large.png");
  }

  @override
  NetworkCategory mapToRemote(Category type) {
    return NetworkCategory(
      id: type.id,
    );
  }
}
