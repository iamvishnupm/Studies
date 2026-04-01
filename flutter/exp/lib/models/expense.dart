import "package:flutter/material.dart";
import "package:uuid/uuid.dart";
import "package:intl/intl.dart";

const uuid = Uuid();
final dateFormatter = DateFormat.yMd();

enum Category { food, travel, study, fun }

const Map<Category, IconData> categoryIcon = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.study: Icons.book,
  Category.fun: Icons.movie,
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  IconData get icon => categoryIcon[category]!;
  get formattedDate => dateFormatter.format(date);

  static List<Expense> fromData(List<dynamic> data) {
    return data
        .map(
          (expense) => Expense(
            title: expense['title'] as String,
            amount: (expense['amount'] as num).toDouble(),
            date: DateTime.parse(expense['date']),
            category: Category.values.firstWhere(
              (c) => c.name == expense['category'],
              orElse: () => Category.fun,
            ),
          ),
        )
        .toList();
  }
}
