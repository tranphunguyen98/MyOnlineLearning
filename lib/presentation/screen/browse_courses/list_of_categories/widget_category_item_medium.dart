import 'package:flutter/material.dart';
import 'package:my_online_learning/model/entity/category.dart';
import 'package:my_online_learning/presentation/screen/router.dart';
import 'package:my_online_learning/utils/extensions.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';

class CategoryItemMedium extends StatelessWidget {
  final Category category;

  const CategoryItemMedium(this.category);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(MyRouter.CATEGORY_DETAIL);
      },
      child: Stack(
        children: [
          Image.asset(
            category.image,
            fit: BoxFit.cover,
            height: 80.0,
            width: 140.0,
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black26,
            ),
          ),
          Positioned.fill(
            child: Align(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FittedBox(
                  child: Text(
                    category.title,
                    style: StyleConst.textMediumBold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
