import "package:flutter/material.dart";
import "package:xyz/models/meal.dart";
import "package:xyz/widgets/meal_item.dart";

class MealsListScreen extends StatelessWidget {
  final List<Meal> mealsList;
  final String? title;

  const MealsListScreen({
    //
    super.key,
    this.title,
    required this.mealsList,
  });

  @override
  Widget build(context) {
    Widget content = Center(
      child: Text(
        "No items",
        style: TextStyle(
          //
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );

    if (mealsList.isNotEmpty) {
      content = ListView.builder(
        itemCount: mealsList.length,
        itemBuilder: (ctx, i) => MealItem(meal: mealsList[i]),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          //
          title!,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: content,
    );
  }
}
