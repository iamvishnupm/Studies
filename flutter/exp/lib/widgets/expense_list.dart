import "package:exp/data/expense_data.dart";
import "package:exp/models/expense.dart";
import "package:exp/widgets/expense_item.dart";
import "package:flutter/material.dart";

class ExpenseListWidget extends StatefulWidget {
  const ExpenseListWidget({super.key});

  @override
  State<ExpenseListWidget> createState() => _ExpenseListWidgetState();
}

class _ExpenseListWidgetState extends State<ExpenseListWidget> {
  //

  void _removeExpense(Expense expense) {
    //

    final int index = expenseList.indexOf(expense);

    setState(() {
      expenseList.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Expense Deleted"),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              expenseList.insert(index, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expenseList.length,
      itemBuilder: (context, index) {
        //
        return Dismissible(
          key: ValueKey(expenseList[index]),
          onDismissed: (direction) {
            //
            _removeExpense(expenseList[index]);
          },
          child: ExpenseItem(expense: expenseList[index]),
        );
      },
    );
  }
}
