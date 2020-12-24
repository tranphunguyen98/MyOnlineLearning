import 'package:my_online_learning/remote/model/network_course.dart';

class NetworkAuthor {
  final String id;
  final String name;
  final String avatar;
  final String intro;
  final String numcourses;
  final List<NetworkCourse> courses;

  NetworkAuthor(
      {this.id = "",
      this.name = "",
      this.avatar = "",
      this.intro = "",
      this.numcourses = "0",
      this.courses = const []});

  factory NetworkAuthor.fromJson(Map<String, dynamic> json) => NetworkAuthor(
        id: json['id'] as String,
        name: json['name'] as String,
        avatar: json['avatar'] as String,
        intro: json['intro'] as String,
        numcourses: json['numcourses'] as String,
        courses: ((json['courses'] as List) ?? [])
            .map((e) => NetworkCourse.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'avatar': avatar,
        'intro': intro,
        'courses': courses,
      };

  @override
  String toString() {
    return 'NetworkAuthor{id: $id, name: $name, avatar: $avatar, intro: $intro, courses: $courses}';
  }
}
