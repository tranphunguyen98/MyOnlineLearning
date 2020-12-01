import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:my_online_learning/di/injection.dart';
import 'package:my_online_learning/model/entity/author.dart';
import 'package:my_online_learning/remote/mapper/network_author_mapper.dart';
import 'package:my_online_learning/remote/model/network_author.dart';

@injectable
class AuthorSevice {
  Future<List<Author>> getAuthor() async {
    // Đọc file json dưới dạng chuỗi
    String jsonString =
        await rootBundle.loadString('sample_data/authors_detail.json');
    //print(jsonString);
    // Giải mã file json sang Map
    List<Author> listAuthor = <Author>[];

    listAuthor = (json.decode(jsonString)["payload"] as List)
        .map((i) => getIt<NetworkAuthorMapper>()
            .mapFromRemote(NetworkAuthor.fromJson(i as Map<String, dynamic>)))
        .toList();

    listAuthor.shuffle();
    return listAuthor;
  }
}
