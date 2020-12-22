import 'package:flutter/material.dart';
import 'package:my_online_learning/data/repository/author/course_repository_impl.dart';
import 'package:my_online_learning/data/repository/course/i_course_repository.dart';
import 'package:my_online_learning/di/injection.dart';
import 'package:my_online_learning/model/entity/author.dart';
import 'package:my_online_learning/model/entity/category.dart';
import 'package:my_online_learning/model/entity/course.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/browse/sc_browse.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/list_of_authors/widget_category_author.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/list_of_categories/widget_category_course.dart';
import 'package:my_online_learning/remote/model/option_search.dart';
import 'package:provider/provider.dart';

class CategoryDetailScreen extends StatelessWidget {
  final Category category;

  const CategoryDetailScreen({this.category});

  @override
  Widget build(BuildContext context) {
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
              FutureBuilder<List<Course>>(
                future: getIt<ICourseRepository>()
                    .search("", OptionSearch(category: [category.id])),
                builder: (context, snapshot) => snapshot.hasData
                    ? Provider<Category>(
                        create: (context) => Category(
                            title: "NEW IN ${category.title}",
                            courses: snapshot.data),
                        child: WidgetCategoryCourse())
                    : Container(),
              ),
              FutureBuilder<List<Course>>(
                future: getIt<ICourseRepository>()
                    .search("", OptionSearch(category: [category.id])),
                builder: (context, snapshot) => snapshot.hasData
                    ? Provider<Category>(
                        create: (context) => Category(
                            title: "TRENDING IN  ${category.title}",
                            courses: snapshot.data),
                        child: WidgetCategoryCourse())
                    : Container(),
              ),
              FutureBuilder<List<Author>>(
                future: getIt<AuthorRepository>().getAuthors(),
                builder: (context, snapshot) => snapshot.hasData
                    ? Provider<List<Author>>(
                        create: (context) => snapshot.data,
                        child: WidgetCategoryAuthor(
                          title: "TOP AUTHORS IN ${category.title}",
                        ),
                      )
                    : Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
