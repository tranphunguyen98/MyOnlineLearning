import 'package:my_online_learning/model/entity/course.dart';

class Path {
  final String title;
  final String image;
  final List<Course> courses;

  const Path(this.title, this.image, this.courses);

  static const List<Path> listPath = [
    Path("Java", "images/java.png", Course.listCourse),
    Path("Java Unit Testing", "images/java.png", Course.listCourse),
    Path("Design Patterns in Java", "images/java.png", Course.listCourse),
  ];
}
