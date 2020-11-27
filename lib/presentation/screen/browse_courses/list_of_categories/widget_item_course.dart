import 'package:flutter/material.dart';
import 'package:my_online_learning/model/entity/course.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/list_of_categories/widget_column_info_course.dart';
import 'package:my_online_learning/presentation/screen/router.dart';
import 'package:my_online_learning/utils/extensions.dart';
import 'package:share/share.dart';

import '../../home_page.dart';

class ItemCourse extends StatelessWidget {
  final Course course;

  ItemCourse({this.course});

  String get sharingText => "I'm watching ${course.title} from Online Learning";

  List<DropdownChoices> get dropdownChoices => [
        DropdownChoices(title: "Bookmark", onPressed: (context) {}),
        DropdownChoices(title: "Download", onPressed: (context) {}),
        DropdownChoices(
            title: "Share",
            onPressed: (context) {
              Share.share(sharingText);
            }),
      ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(MyRouter.COURSE_DETAIL),
      child: Container(
        color: context.theme.primaryColor,
        child: Column(
          children: [
            Container(
                width: 190.0,
                height: 120.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: AssetImage(course.imageUrl)))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: WidgetColumnInfoCourse(
                course: course,
              ),
            )
          ],
        ),
      ),
    );
  }
}
