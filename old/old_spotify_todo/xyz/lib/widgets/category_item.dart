import "package:flutter/material.dart";
import "package:xyz/data/meals.dart";
import "package:xyz/models/category.dart";
import "package:xyz/screens/meals_list_screen.dart";
import "package:xyz/utils/functions.dart";

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem({
    //
    super.key,
    required this.category,
  });

  @override
  Widget build(context) {
    //

    final mealsList = meals
        .where((m) => m.categories.contains(category.id))
        .toList();

    return InkWell(
      onTap: () => loadScreen(
        context,
        MealsListScreen(
          //
          title: category.title,
          mealsList: mealsList,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              //
              category.color.withAlpha(170),
              category.color.withAlpha(255),
            ],
          ),
        ),
        child: Text(category.title, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
