import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_online_learning/data/repository/author/course_repository_impl.dart';
import 'package:my_online_learning/di/injection.dart';
import 'package:my_online_learning/model/entity/author.dart';
import 'package:my_online_learning/model/entity/category.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/list_of_authors/widget_category_author.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/list_of_categories/widget_category_item_large.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/list_of_categories/widget_category_item_medium.dart';
import 'package:my_online_learning/utils/extensions.dart';
import 'package:provider/provider.dart';

class BrowseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
//      color: COLOR_CONST.BACKGROUND_DARK,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListCategoryLarge(),
              ListCategoryMedium(categories: Category.categories),
              SizedBox(height: 32.0),
              ListSkill(),
              FutureBuilder<List<Author>>(
                future: getIt<AuthorRepository>().getAuthors(),
                builder: (context, snapshot) => snapshot.hasData
                    ? Provider<List<Author>>(
                        create: (context) => snapshot.data,
                        child: WidgetCategoryAuthor(
                          title: "TOP AUTHORS",
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

class ListCategoryMedium extends StatelessWidget {
  final List<Category> categories;
  const ListCategoryMedium({
    Key key,
    @required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: ConstrainedBox(
        constraints: new BoxConstraints(
          minHeight: 30.0,
          maxHeight: 160.0,
        ),
        child: GridView.builder(
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.6,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoryItemMedium(categories[index]);
          },
        ),
      ),
    );
  }
}

class ListSkill extends StatelessWidget {
  const ListSkill({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Popular Skills",
          style: context.textTheme.subtitle2,
        ),
        SizedBox(
          height: 16.0,
        ),
        SizedBox(
          height: 40.0,
          child: ListView.builder(
              itemCount: 8,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Chip(
//                      backgroundColor: COLOR_CONST.GRAY_LIGHT,
                      label: Text(
                    "Angular",
                    style: context.textTheme.subtitle2,
                  )),
                );
              }),
        ),
      ],
    );
  }
}

class ListCategoryLarge extends StatelessWidget {
  const ListCategoryLarge({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoryItemLarge(
            "NEW\nRELEASES", "images/background_category_large.png"),
        SizedBox(height: 16.0),
        CategoryItemLarge(
            "RECOMMENDED\nFOR YOU", "images/background_category_large.png"),
      ],
    );
  }
}
