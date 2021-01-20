import 'package:flutter/material.dart';
import 'package:my_online_learning/data/model/my_courses.dart';
import 'package:my_online_learning/model/entity/chapter.dart';
import 'package:my_online_learning/utils/extensions.dart';
import 'package:my_online_learning/utils/my_const/style_const.dart';
import 'package:provider/provider.dart';

class ItemChapter extends StatelessWidget {
  final Chapter chapter;
  final Function(String, String) changeVideoLink;

  const ItemChapter(this.chapter, this.changeVideoLink);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderSection(chapter: chapter),
        SizedBox(
          height: 16.0,
        ),
        ...chapter.listLesson.map((lesson) => GestureDetector(
              onTap: () {
                if (context.read<MyCourses>().containId(chapter.courseId)) {
                  print("video: ${lesson.videoUrl}");
                  //context.read<LinkVideoPlay>().link = lesson.videoUrl;
                  changeVideoLink(lesson.videoUrl, lesson.videoName);
                } else {
                  print("NOOOOOOOOOOO");
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 16.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.stop_circle,
                      color: lesson.isStudying
                          ? Colors.green
                          : context.theme.primaryColorDark,
                      size: 12,
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Expanded(
                        child: Text(
                      lesson.name,
                      style: context.textTheme.subtitle2,
                    )),
                    Text(
                      lesson.durationString,
                      style: StyleConst.textRegularGray,
                    ),
                  ],
                ),
              ),
            ))
      ],
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    Key key,
    @required this.chapter,
  }) : super(key: key);

  final Chapter chapter;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      height: 60.0,
      child: Row(children: [
        Container(
          width: 60.0,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  color: context.theme.primaryColorDark,
                  child: Text(
                    chapter.numberOrder.toString(),
                    style: context.textTheme.subtitle2,
                  ),
                ),
              ),
              Container(
                height: 4.0,
                color: chapter.isStudying
                    ? Colors.green
                    : context.theme.primaryColorLight,
              )
            ],
          ),
        ),
        SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                chapter.name,
                //TODO style: context.textTheme.subtitle2,
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                chapter.durationString,
                style: StyleConst.textRegularGray,
              )
            ],
          ),
        ),
        Icon(
          Icons.more_vert,
          color: Colors.white,
        )
      ]),
    );
  }
}

class HeaderAuthor extends StatelessWidget {
  const HeaderAuthor({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: context.textTheme.subtitle2,
          ),
        ],
      ),
    );
  }
}
