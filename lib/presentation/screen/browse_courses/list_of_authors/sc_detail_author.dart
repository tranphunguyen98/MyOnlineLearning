import 'package:flutter/material.dart';
import 'package:my_online_learning/data/repository/author/course_repository_impl.dart';
import 'package:my_online_learning/di/injection.dart';
import 'package:my_online_learning/model/entity/author.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_circle_avatar_network.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_my_outline_btn.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_my_raised_btn.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/list_of_courses/widget_list_course_v.dart';
import 'package:my_online_learning/utils/extensions.dart';

class AuthorDetailScreen extends StatelessWidget {
  final String _instructorId;

  AuthorDetailScreen(this._instructorId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Author",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: context.theme.primaryColor,
      ),
      body: FutureBuilder<Author>(
        future: getIt<AuthorRepository>().getAuthorDetail(_instructorId),
        builder: (context, authorSnapshot) {
          if (authorSnapshot.hasData) {
            return Container(
              color: context.theme.backgroundColor,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    HeaderInfo(author: authorSnapshot.data),
                    SizedBox(
                      height: 32.0,
                    ),
                    Text(
                      "Courses",
                      style: context.textTheme.subtitle2,
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                    WidgetListCourseVertical(
                        listCourse: authorSnapshot.data.courses)
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class HeaderInfo extends StatefulWidget {
  HeaderInfo({
    Key key,
    @required Author author,
  })  : _author = author,
        super(key: key);

  final Author _author;

  @override
  _HeaderInfoState createState() => _HeaderInfoState();
}

class _HeaderInfoState extends State<HeaderInfo> {
  bool isFollow = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 16.0),
        CircleAvatarNetwork(networkImageUrl: widget._author.avatar, size: 64.0),
        SizedBox(height: 16.0),
        Text(
          widget._author.name,
          style:
              context.textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16.0),
        SizedBox(
          width: double.infinity,
          child: isFollow
              ? MyOutlineButton(
                  "FOLLOWING",
                  onPressed: () {
                    setState(() {
                      isFollow = false;
                    });
                  },
                )
              : MyRaisedButton(
                  title: "FOLLOW",
                  onPressed: () {
                    setState(() {
                      isFollow = true;
                    });
                  },
                ),
        )
      ],
    );
  }
}
