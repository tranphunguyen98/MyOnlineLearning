import 'package:flutter/material.dart';
import 'package:my_online_learning/model/entity/category.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/category_detail/sc_category_detail.dart';
import 'package:my_online_learning/utils/extensions.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';

class CategoryItemLarge extends StatelessWidget {
  final Category category;

  const CategoryItemLarge(this.category);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(CategoryDetailScreen(
          category: category,
          alreadyHaveData: true,
        ));
      },
      child: Stack(
        children: [
          Image.asset(
            category.image,
            fit: BoxFit.cover,
            height: 100.0,
            width: double.infinity,
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black26,
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                category.title,
                textAlign: TextAlign.center,
                style: StyleConst.textLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
