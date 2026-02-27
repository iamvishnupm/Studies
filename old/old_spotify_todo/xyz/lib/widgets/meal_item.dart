import "package:flutter/material.dart";
import "package:xyz/models/meal.dart";
import "package:transparent_image/transparent_image.dart";
import "package:xyz/screens/meal_details_screen.dart";
import "package:xyz/utils/functions.dart";

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem({
    //
    super.key,
    required this.meal,
  });

  @override
  Widget build(context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        //
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => loadScreen(
          //
          context,
          MealDetailsScreen(meal),
        ),
        child: Stack(
          children: [
            FadeInImage(
              width: 400,
              height: 300,
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                color: Colors.black87,
                child: Center(
                  child: Text(
                    //
                    meal.title,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
