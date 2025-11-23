import "package:flutter/material.dart";
import "package:xyz/data/categories.dart";
import "package:xyz/widgets/category_item.dart";

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(context) {
    return SafeArea(
      child: GridView(
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          //
          for (final cat in categories) CategoryItem(category: cat),
        ],
      ),
    );
  }
}
