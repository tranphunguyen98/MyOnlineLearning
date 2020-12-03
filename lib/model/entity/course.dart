import 'package:my_online_learning/model/entity/chapter.dart';

class Course {
  final String id;
  final String title;
  final String subtitle;
  final String price;
  final double ratedNumber;
  final int totalMinutes;
  final String imageUrl;
  final String createdAt;
  final String level;
  final String instructorName;
  final String instructorAvatar;
  final String instructorId;
  final String description;
  final List<Chapter> chapters;

  const Course({
    this.instructorId,
    this.instructorName,
    this.instructorAvatar,
    this.id = "",
    this.title = "",
    this.subtitle = "",
    this.price = "",
    this.ratedNumber = 0.0,
    this.totalMinutes = 0,
    this.imageUrl = "",
    this.createdAt = "",
    this.level = "",
    this.description = "",
    this.chapters,
  });

  static const List<Course> listCourse = [
    Course(
        id: "1",
        title: "Angular Fundamentals",
        instructorName: "jose",
        level: "Intermediate",
        createdAt: "Apr 2020",
        totalMinutes: 575,
        ratedNumber: 4.2,
        chapters: Chapter.listChapter,
        imageUrl: "images/course_image_2.jpg",
        description: "")
  ];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Course && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
