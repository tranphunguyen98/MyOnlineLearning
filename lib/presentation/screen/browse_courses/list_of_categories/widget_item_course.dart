import 'package:flutter/material.dart';
import 'package:my_online_learning/model/entity/course.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/list_of_categories/widget_column_info_course.dart';
import 'package:my_online_learning/presentation/screen/home_page.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';
import 'package:share/share.dart';

class ItemCourse extends StatelessWidget {
  final Course course;

  ItemCourse({this.course});

  final List<DropdownChoices> dropdownChoices = [
    DropdownChoices(title: "Bookmark"),
    DropdownChoices(title: "Download"),
    DropdownChoices(title: "Share"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: COLOR_CONST.GRAY_LIGHT,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(children: [
            Image(
              image: AssetImage(course.imageUrl),
              width: 190.0,
              height: 120.0,
              fit: BoxFit.fitWidth,
            ),
            Positioned(
              right: 0.0,
              top: 0.0,
              child: PopupMenuButton<DropdownChoices>(
                color: Colors.white,
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                onSelected: (DropdownChoices choice) {
                  Share.share(
                      "I'm watching ${course.title} from Online Learning");
                },
                elevation: 6,
                itemBuilder: (BuildContext context) {
                  return dropdownChoices.map((DropdownChoices choice) {
                    return PopupMenuItem<DropdownChoices>(
                      value: choice,
                      child: Text(choice.title),
                    );
                  }).toList();
                },
              ),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: WidgetColumnInfoCourse(
              course: course,
            ),
          )
        ],
      ),
    );
  }
}
