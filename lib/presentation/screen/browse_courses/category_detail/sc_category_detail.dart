import 'package:flutter/material.dart';
import 'package:my_online_learning/model/entity/category.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/browse/sc_browse.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/list_of_authors/widget_category_author.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/list_of_categories/widget_category_course.dart';

class CategoryDetailScreen extends StatelessWidget {
  Category category;

  CategoryDetailScreen({this.category});

  @override
  Widget build(BuildContext context) {
    category = Category.categories[0];
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(category.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  background: Image.asset(
                    category.image,
                    fit: BoxFit.cover,
                  )),
            ),
          ];
        },
        body: Expanded(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(16.0),
            children: <Widget>[
              ListSkill(),
              WidgetCategoryCourse(title: "New in ${category.title}"),
              WidgetCategoryCourse(title: "Trending in ${category.title}"),
              WidgetCategoryAuthor(title: "Top authors in ${category.title}"),
            ],
          ),
        ),
      ),
    );
  }
}
