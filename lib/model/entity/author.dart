import 'package:my_online_learning/model/entity/course.dart';

class Author {
  final String id;
  final String name;
  final String imageUrl;
  final List<Course> courses;

  const Author(
      {this.id = "", this.name = "", this.imageUrl = "", this.courses});

  static List<Author> listAuthor = [
    Author(
        id: "1",
        name: "The Rock",
        imageUrl: "images/author_1.jfif",
        courses: Course.listCourse),
    Author(
        id: "2",
        name: "Will Smith",
        imageUrl: "images/author_2.jfif",
        courses: Course.listCourse),
    Author(
        id: "3",
        name: "Chris Hemsworth",
        imageUrl: "images/author_3.jfif",
        courses: Course.listCourse),
    Author(
        id: "4",
        name: "The Rock",
        imageUrl: "images/author_1.jfif",
        courses: Course.listCourse),
    Author(
        id: "5",
        name: "Will Smith",
        imageUrl: "images/author_2.jfif",
        courses: Course.listCourse),
    Author(
        id: "6",
        name: "Chris Hemsworth",
        imageUrl: "images/author_3.jfif",
        courses: Course.listCourse),
  ];
}
