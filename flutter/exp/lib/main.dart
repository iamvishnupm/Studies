import "package:exp/data/expense_data.dart";
import "package:exp/models/expense.dart";
import "package:exp/widgets/new_expense.dart";
import "package:flutter/material.dart";
import "package:exp/widgets/expense_list.dart";

void main() {
  runApp(
    MaterialApp(
      //
      debugShowCheckedModeBanner: false,
      home: ExpenseTracker(),
    ),
  );
}

class ExpenseTracker extends StatefulWidget {
  const ExpenseTracker({super.key});

  @override
  State<ExpenseTracker> createState() => _ExpenseTrackerState();
}

class _ExpenseTrackerState extends State<ExpenseTracker> {
  //

  void _addExpense() {
    showModalBottomSheet(
      //
      context: context,
      builder: (ctx) => NewExpense(addNewExpense: addNewExpense),
    );
  }

  void addNewExpense(Expense expense) {
    setState(() {
      expenseList.add(expense);
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
        actions: [
          //
          IconButton(onPressed: _addExpense, icon: Icon(Icons.add)),
        ],
      ),
      body: ExpenseListWidget(),
    );
  }
}
