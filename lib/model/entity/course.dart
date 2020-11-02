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
  final List<String> instructorNames;
  final String description;

  const Course(
      {this.id = "",
      this.title = "",
      this.subtitle = "",
      this.price = "",
      this.ratedNumber = 0.0,
      this.totalMinutes = 0,
      this.imageUrl = "",
      this.createdAt = "",
      this.level = "",
      this.instructorNames,
      this.description = ""});

  static const List<Course> listCourse = [
    Course(
        id: "1",
        title: "Angular Fundamentals",
        instructorNames: ["Tran Phu Nguyen", "Joe Eames"],
        level: "Intermediate",
        createdAt: "Apr 2020",
        totalMinutes: 575,
        ratedNumber: 4.2,
        imageUrl: "images/course_image_2.jpg",
        description:
            "Angular is one of the fastest, most popular open source web app frameworks today, and knowing how to use it is essential for developers. You'll learn how to create components and user interfaces, data-binding, retrieving data using HTTP, and more."),
    Course(
      id: "2",
      title: "C# Fundamentals",
      instructorNames: ["Scott Allen"],
      level: "Intermediate",
      createdAt: "Apr 2020",
      totalMinutes: 575,
      ratedNumber: 5,
      imageUrl: "images/course_image_2.jpg",
    ),
    Course(
      id: "1",
      title: "Angular Fundamentals",
      instructorNames: ["Tran Phu Nguyen", "Joe Eames"],
      level: "Intermediate",
      createdAt: "Apr 2020",
      totalMinutes: 575,
      ratedNumber: 4.2,
      imageUrl: "images/course_image_2.jpg",
    ),
    Course(
      id: "2",
      title: "C# Fundamentals",
      instructorNames: ["Scott Allen"],
      level: "Intermediate",
      createdAt: "Apr 2020",
      totalMinutes: 575,
      ratedNumber: 5,
      imageUrl: "images/course_image_2.jpg",
    ),
    Course(
      id: "1",
      title: "Angular Fundamentals",
      instructorNames: ["Tran Phu Nguyen", "Joe Eames"],
      level: "Intermediate",
      createdAt: "Apr 2020",
      totalMinutes: 575,
      ratedNumber: 4.2,
      imageUrl: "images/course_image_2.jpg",
    ),
    Course(
      id: "2",
      title: "C# Fundamentals",
      instructorNames: ["Scott Allen"],
      level: "Intermediate",
      createdAt: "Apr 2020",
      totalMinutes: 575,
      ratedNumber: 5,
      imageUrl: "images/course_image_2.jpg",
    ),
    Course(
      id: "1",
      title: "Angular Fundamentals",
      instructorNames: ["Tran Phu Nguyen", "Joe Eames"],
      level: "Intermediate",
      createdAt: "Apr 2020",
      totalMinutes: 575,
      ratedNumber: 4.2,
      imageUrl: "images/course_image_2.jpg",
    ),
    Course(
      id: "2",
      title: "C# Fundamentals",
      instructorNames: ["Scott Allen"],
      level: "Intermediate",
      createdAt: "Apr 2020",
      totalMinutes: 575,
      ratedNumber: 5,
      imageUrl: "images/course_image_2.jpg",
    ),
  ];
}
