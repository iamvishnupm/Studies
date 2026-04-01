import "package:exp/data/expense_data.dart";
import "package:flutter/material.dart";

class ExpenseListWidget extends StatefulWidget {
  const ExpenseListWidget({super.key});

  @override
  State<ExpenseListWidget> createState() => _ExpenseListWidgetState();
}

class _ExpenseListWidgetState extends State<ExpenseListWidget> {
  @override
  Widget build(context) {
    return ListView(
      children: expenseList
          .map(
            (expense) => Card(
              color: Colors.white70,
              margin: EdgeInsets.all(8),
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
                              SizedBox(width: 8),
                              Icon(expense.icon, size: 18),
                            ],
                          ),
                        ),
                        Text(expense.formattedDate),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        //
                        Text("\$${expense.amount}"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
