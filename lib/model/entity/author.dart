import 'package:my_online_learning/model/entity/course.dart';

class Author {
  final String id;
  final String name;
  final String avatar;
  final List<Course> courses;

  const Author({this.id = "", this.name = "", this.avatar = "", this.courses});

  static List<Author> listAuthor = [
    Author(
        id: "1",
        name: "The Rock",
        avatar: "images/author_1.jfif",
        courses: Course.listCourse),
    Author(
        id: "2",
        name: "Will Smith",
        avatar: "images/author_2.jfif",
        courses: Course.listCourse),
    Author(
        id: "3",
        name: "Chris Hemsworth",
        avatar: "images/author_3.jfif",
        courses: Course.listCourse),
    Author(
        id: "4",
        name: "The Rock",
        avatar: "images/author_1.jfif",
        courses: Course.listCourse),
    Author(
        id: "5",
        name: "Will Smith",
        avatar: "images/author_2.jfif",
        courses: Course.listCourse),
    Author(
        id: "6",
        name: "Chris Hemsworth",
        avatar: "images/author_3.jfif",
        courses: Course.listCourse),
  ];
}
