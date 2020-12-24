import 'package:injectable/injectable.dart';
import 'package:my_online_learning/model/entity/author.dart';
import 'package:my_online_learning/remote/mapper/network_mapper.dart';
import 'package:my_online_learning/remote/model/response/item_author_response.dart';

@Injectable()
class ResponseAuthorMapper
    implements NetworkMapper<ItemAuthorResponse, Author> {
  @override
  Author mapFromRemote(ItemAuthorResponse type) {
    print(type);
    return Author(
      id: type.id,
      avatar: type.avatar,
      name: type.name,
    );
  }

  @override
  ItemAuthorResponse mapToRemote(Author type) {
    return ItemAuthorResponse(
      id: type.id,
      avatar: type.avatar,
      name: type.name,
    );
  }
}
