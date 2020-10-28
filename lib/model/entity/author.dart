class Author {
  final String id;
  final String name;
  final String imageUrl;

  const Author({
    this.id = "",
    this.name = "",
    this.imageUrl = "",
  });

  static List<Author> listAuthor = [
    Author(id: "1", name: "The Rock", imageUrl: "images/author_1.jfif"),
    Author(id: "2", name: "Will Smith", imageUrl: "images/author_2.jfif"),
    Author(id: "3", name: "Chris Hemsworth", imageUrl: "images/author_3.jfif"),
    Author(id: "4", name: "The Rock", imageUrl: "images/author_1.jfif"),
    Author(id: "5", name: "Will Smith", imageUrl: "images/author_2.jfif"),
    Author(id: "6", name: "Chris Hemsworth", imageUrl: "images/author_3.jfif"),
  ];
}
