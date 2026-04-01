import "package:exp/models/expense.dart";
import "package:flutter/material.dart";

class ExpenseItem extends StatelessWidget {
  final Expense expense;

  const ExpenseItem({
    //
    super.key,
    required this.expense,
  });

  @override
  Widget build(context) {
    return Card(
      color: Colors.white70,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          //
                          expense.title,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(expense.icon, size: 18),
                    ],
                  ),
                ),
                Text(expense.formattedDate),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                //
                Text("\$${expense.amount}"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
