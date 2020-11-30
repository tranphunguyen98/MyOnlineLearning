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
    // Category("CONFERENCES", "images/background_category_large.png",
    //     Course.listCourse),
    // Category(
    //     "IT OPS", "images/background_category_large.png", Course.listCourse),
    // Category("CERTIFICATIONS", "images/background_category_large.png",
    //     Course.listCourse),
    // Category(
    //     "BUSINESS", "images/background_category_large.png", Course.listCourse),
    // Category("CONFERENCES", "images/background_category_large.png",
    //     Course.listCourse),
    // Category(
    //     "IT OPS", "images/background_category_large.png", Course.listCourse),
    // Category("CERTIFICATIONS", "images/background_category_large.png",
    //     Course.listCourse),
  ];
}
