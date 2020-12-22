import 'course.dart';

class Category {
  final String title, image;
  final List<Course> courses;

  const Category(this.title, this.courses, [this.image = ""]);

  static const List<Category> categories = [];
}
