import 'course.dart';

class Category {
  final String title, image;
  final List<Course> courses;

  const Category(this.title, this.courses, [this.image = ""]);

  static const List<Category> categories = [
    Category(
      "BUSINESS",
      Course.listCourse,
      "images/background_category_large.png",
    ),
    Category(
      "CONFERENCES",
      Course.listCourse,
      "images/background_category_large.png",
    ),
    Category(
      "CERTIFICATIONS",
      Course.listCourse,
      "images/background_category_large.png",
    ),
    Category(
      "BUSINESS",
      Course.listCourse,
      "images/background_category_large.png",
    ),
    Category(
      "IT OPS",
      Course.listCourse,
      "images/background_category_large.png",
    ),
    Category(
      "DEVELOPMENT",
      Course.listCourse,
      "images/background_category_large.png",
    ),
  ];
}
