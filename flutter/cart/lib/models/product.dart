import "package:flutter/material.dart";
import "package:uuid/uuid.dart";

const uuid = Uuid();

enum Category { food, drinks, electronics, books, clothing, home }

extension CategoryColors on Category {
  Color get color {
    switch (this) {
      case Category.food:
        return Colors.green;
      case Category.drinks:
        return Colors.orange;
      case Category.electronics:
        return Colors.purple;
      case Category.books:
        return Colors.brown;
      case Category.clothing:
        return Colors.pink;
      case Category.home:
        return Colors.blue;
    }
  }
}

class Product {
  final String id;
  final String title;
  final int quantity;
  final Category category;

  Product(
    //
    this.title,
    this.quantity,
    this.category, {
    String? id,
  }) : id = id ?? uuid.v4();

  static List<Product> fromData(Map<String, dynamic> data) {
    return data.entries
        .map(
          (item) => Product(
            item.value['title'] as String,
            item.value['quantity'] as int,
            Category.values.firstWhere(
              (cat) => cat.name == item.value['category'],
            ),
            id: item.key,
          ),
        )
        .toList();
  }
}
