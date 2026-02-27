import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:xyz/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  final Meal meal;
  const MealDetailsScreen(this.meal, {super.key});

  @override
  Widget build(BuildContext context) {
    // final appState = context.watch<StateProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              // appState.toggleFavorites(meal);
            },
            icon: Icon(Icons.star),
            style: IconButton.styleFrom(
              // foregroundColor:
              // appState.isFavorite(meal) ? Colors.yellow : Colors.grey,
              foregroundColor: Colors.yellowAccent.shade700,
              //
            ),
          ),
        ],
      ),
      body: Image.network(meal.imageUrl),
    );
  }
}
