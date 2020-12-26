import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_online_learning/remote/model/network_author.dart';
import 'package:my_online_learning/remote/model/network_chapter.dart';

part 'network_course_detail.g.dart';

@JsonSerializable(nullable: false)
class NetworkCourseDetail {
  final String id;
  final String title;
  final String subtitle;
  final int price;
  final String description;
  final int ratedNumber;
  final double totalHours;
  final String imageUrl;
  final String promoVidUrl;
  final String updatedAt;
  final String instructorId;
  final String instructorName;
  final List<NetworkChapter> section;
  final NetworkAuthor instructor;

  factory NetworkCourseDetail.fromJson(Map<String, dynamic> json) =>
      _$NetworkCourseDetailFromJson(json);
  Map<String, dynamic> toJson() => _$NetworkCourseDetailToJson(this);

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const NetworkCourseDetail({
    @required this.id,
    @required this.title,
    @required this.subtitle,
    @required this.price,
    @required this.description,
    @required this.ratedNumber,
    @required this.totalHours,
    @required this.imageUrl,
    @required this.promoVidUrl,
    @required this.updatedAt,
    @required this.instructorId,
    @required this.instructorName,
    @required this.section,
    @required this.instructor,
  });

  NetworkCourseDetail copyWith({
    String id,
    String title,
    String subtitle,
    int price,
    String description,
    int ratedNumber,
    double totalHours,
    String imageUrl,
    String promoVidUrl,
    String updatedAt,
    String instructorId,
    String instructorName,
    List<NetworkChapter> section,
    NetworkAuthor instructor,
  }) {
    if ((id == null || identical(id, this.id)) &&
        (title == null || identical(title, this.title)) &&
        (subtitle == null || identical(subtitle, this.subtitle)) &&
        (price == null || identical(price, this.price)) &&
        (description == null || identical(description, this.description)) &&
        (ratedNumber == null || identical(ratedNumber, this.ratedNumber)) &&
        (totalHours == null || identical(totalHours, this.totalHours)) &&
        (imageUrl == null || identical(imageUrl, this.imageUrl)) &&
        (promoVidUrl == null || identical(promoVidUrl, this.promoVidUrl)) &&
        (updatedAt == null || identical(updatedAt, this.updatedAt)) &&
        (instructorId == null || identical(instructorId, this.instructorId)) &&
        (instructorName == null ||
            identical(instructorName, this.instructorName)) &&
        (section == null || identical(section, this.section)) &&
        (instructor == null || identical(instructor, this.instructor))) {
      return this;
    }

    return new NetworkCourseDetail(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      price: price ?? this.price,
      description: description ?? this.description,
      ratedNumber: ratedNumber ?? this.ratedNumber,
      totalHours: totalHours ?? this.totalHours,
      imageUrl: imageUrl ?? this.imageUrl,
      promoVidUrl: promoVidUrl ?? this.promoVidUrl,
      updatedAt: updatedAt ?? this.updatedAt,
      instructorId: instructorId ?? this.instructorId,
      instructorName: instructorName ?? this.instructorName,
      section: section ?? this.section,
      instructor: instructor ?? this.instructor,
    );
  }

  @override
  String toString() {
    return 'NetworkCourseDetail{id: $id, title: $title, subtitle: $subtitle, price: $price, description: $description, ratedNumber: $ratedNumber, totalHours: $totalHours, imageUrl: $imageUrl, promoVidUrl: $promoVidUrl, updatedAt: $updatedAt, instructorId: $instructorId, instructorName: $instructorName, section: $section, instructor: $instructor}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NetworkCourseDetail &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          subtitle == other.subtitle &&
          price == other.price &&
          description == other.description &&
          ratedNumber == other.ratedNumber &&
          totalHours == other.totalHours &&
          imageUrl == other.imageUrl &&
          promoVidUrl == other.promoVidUrl &&
          updatedAt == other.updatedAt &&
          instructorId == other.instructorId &&
          instructorName == other.instructorName &&
          section == other.section &&
          instructor == other.instructor);

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      subtitle.hashCode ^
      price.hashCode ^
      description.hashCode ^
      ratedNumber.hashCode ^
      totalHours.hashCode ^
      imageUrl.hashCode ^
      promoVidUrl.hashCode ^
      updatedAt.hashCode ^
      instructorId.hashCode ^
      instructorName.hashCode ^
      section.hashCode ^
      instructor.hashCode;

  factory NetworkCourseDetail.fromMap(Map<String, dynamic> map) {
    return new NetworkCourseDetail(
      id: map['id'] as String,
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
      price: map['price'] as int,
      description: map['description'] as String,
      ratedNumber: map['ratedNumber'] as int,
      totalHours: map['totalHours'] as double,
      imageUrl: map['imageUrl'] as String,
      promoVidUrl: map['promoVidUrl'] as String,
      updatedAt: map['updatedAt'] as String,
      instructorId: map['instructorId'] as String,
      instructorName: map['instructorName'] as String,
      section: map['section'] as List<NetworkChapter>,
      instructor: map['instructor'] as NetworkAuthor,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'title': this.title,
      'subtitle': this.subtitle,
      'price': this.price,
      'description': this.description,
      'ratedNumber': this.ratedNumber,
      'totalHours': this.totalHours,
      'imageUrl': this.imageUrl,
      'promoVidUrl': this.promoVidUrl,
      'updatedAt': this.updatedAt,
      'instructorId': this.instructorId,
      'instructorName': this.instructorName,
      'section': this.section,
      'instructor': this.instructor,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
