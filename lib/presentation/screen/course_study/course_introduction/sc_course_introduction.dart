import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_online_learning/model/entity/Chapter.dart';
import 'package:my_online_learning/model/entity/author.dart';
import 'package:my_online_learning/model/entity/course.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';

import 'ItemFunctionDetail.dart';
import 'WidgetButtonIcon.dart';

class CourseDetailScreen extends StatefulWidget {
  @override
  _CourseDetailScreenState createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  Course course = Course.listCourse[0];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: COLOR_CONST.BACKGROUND_DARK,
      child: ListView(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          _buildVideoView(),
          _buildHeaderInfo(),
          _buildRowFunction(),
          _buildDescription(),
          _buildButtonFunction(),
          _buildContentHeader(),
          SizedBox(height: 16.0),
          _buildContent(),
        ],
      ),
    );
  }

  _buildVideoView() {
    return Stack(
      children: [
        Image(
            height: 200,
            width: double.infinity,
            fit: BoxFit.fitWidth,
            image: AssetImage(course.imageUrl)),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Image(
              height: 80,
              width: 80,
              image: AssetImage("assets/ic_play.png"),
            ),
          ),
        ),
      ],
    );
  }

  _buildItemAuthor() {
    return Chip(
      label: Text(
        Author.listAuthor[0].name,
        style: STYLE_CONST.textRegular,
      ),
      padding: EdgeInsets.all(0.0),
      backgroundColor: COLOR_CONST.GRAY,
      avatar: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: new DecorationImage(
            fit: BoxFit.fill,
            image: new AssetImage(Author.listAuthor[0].imageUrl),
          ),
        ),
      ),
    );
  }

  _buildHeaderInfo() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16.0,
          ),
          Text(
            course.title,
            style: STYLE_CONST.textTitle,
          ),
          SizedBox(
            height: 16.0,
          ),
          Row(
            children: [
              _buildItemAuthor(),
              SizedBox(
                width: 8.0,
              ),
              _buildItemAuthor(),
            ],
          ),
          SizedBox(
            height: 8.0,
          ),
          _buildRowInfo(),
        ],
      ),
    );
  }

  _buildRowInfo() {
    return Row(
      children: [
        Text(
          course.level,
          style: STYLE_CONST.textSmallWhite60,
        ),
        SizedBox(
          width: 4,
        ),
        Icon(
          Icons.circle,
          color: Colors.white60,
          size: 2,
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          course.createdAt,
          style: STYLE_CONST.textSmallWhite60,
        ),
        SizedBox(
          width: 4,
        ),
        Icon(
          Icons.circle,
          color: Colors.white60,
          size: 2,
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          "${course.totalMinutes}m",
          style: STYLE_CONST.textSmallWhite60,
        ),
        SizedBox(
          width: 8.0,
        ),
        _buildRating()
      ],
    );
  }

  _buildRating() {
    return RatingBar(
      initialRating: course.ratedNumber,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      unratedColor: Colors.amber.withAlpha(50),
      itemCount: 5,
      itemSize: 14.0,
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {},
    );
  }

  _buildRowFunction() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ItemFunctionDetail("Bookmark", Icons.bookmark),
          ItemFunctionDetail("Add to channel", Icons.control_point),
          ItemFunctionDetail("Download", Icons.download_rounded),
        ],
      ),
    );
  }

  _buildDescription() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Text(
                course.description,
                style: STYLE_CONST.textRegular,
                maxLines: 3,
              ),
            ),
            SizedBox(
              width: 16.0,
            ),
            Container(
              color: COLOR_CONST.GRAY_LIGHT,
              alignment: Alignment.center,
              child: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildButtonFunction() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          WidgetButtonIcon("Take a learning check", Icons.check_circle_outline),
          WidgetButtonIcon("View related paths & courses", Icons.view_day),
        ],
      ),
    );
  }

  _buildContentHeader() {
    return Align(
      alignment: Alignment.center,
      child: Text(
        "CONTENT",
        style: STYLE_CONST.textMedium,
      ),
    );
  }

  _buildContent() {
    return Container(
      padding: EdgeInsets.only(top: 8.0),
      color: Colors.black,
      child: ListView.separated(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: Chapter.listChapter.length,
        itemBuilder: (context, index) {
          return ItemChapter(Chapter.listChapter[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Divider(
              color: Colors.grey,
            ),
          );
        },
      ),
    );
  }
}

class ItemChapter extends StatelessWidget {
  final Chapter chapter;

  const ItemChapter(this.chapter);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(),
        SizedBox(
          height: 16.0,
        ),
        ...chapter.listLesson.map((lesson) => Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Row(
                children: [
                  Icon(
                    Icons.stop_circle,
                    color: lesson.isStudying
                        ? Colors.green
                        : COLOR_CONST.BACKGROUND_DARK,
                    size: 12,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                      child: Text(
                    lesson.title,
                    style: STYLE_CONST.textRegular,
                  )),
                  Text(
                    lesson.durationString,
                    style: STYLE_CONST.textRegularGray,
                  ),
                ],
              ),
            ))
      ],
    );
  }

  _buildHeader() {
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
                  color: COLOR_CONST.BACKGROUND_DARK,
                  child: Text(
                    chapter.index.toString(),
                    style: STYLE_CONST.textRegular,
                  ),
                ),
              ),
              Container(
                height: 4.0,
                color:
                    chapter.isStudying ? Colors.green : COLOR_CONST.GRAY_LIGHT,
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
                chapter.title,
                style: STYLE_CONST.textRegular,
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                chapter.durationString,
                style: STYLE_CONST.textRegularGray,
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
