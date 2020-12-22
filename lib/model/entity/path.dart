import 'package:my_online_learning/model/entity/course.dart';

class Path {
  final String title;
  final String image;
  final List<Course> courses;

  const Path(this.title, this.image, this.courses);

  static const List<Path> listPath = [];
}
