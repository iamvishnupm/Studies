import "package:exp/models/expense.dart";
import "package:flutter/material.dart";

class NewExpense extends StatefulWidget {
  final void Function(Expense expense) addNewExpense;
  const NewExpense({
    //
    super.key,
    required this.addNewExpense,
  });

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  Category? selectedCategory = Category.fun;
  DateTime? selectedDate;

  void _openDatePicker() async {
    DateTime now = DateTime.now();
    DateTime firstDate = DateTime(now.year - 5, now.month, now.day);

    DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: now,
      initialDate: now,
    );

    setState(() {
      selectedDate = pickedDate;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          //

          // ===============================
          //  1st row
          // ===============================
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _titleController,
                  decoration: InputDecoration(labelText: "Title"),
                ),
              ),
              TextButton.icon(
                onPressed: _openDatePicker,
                label: Text(
                  selectedDate != null
                      ? dateFormatter.format(selectedDate!)
                      : "Select Date",
                ),
                icon: Icon(Icons.calendar_month),
              ),
            ],
          ),

          // ===============================
          //  2nd row
          // ===============================
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _amountController,
                  decoration: InputDecoration(
                    //
                    prefixText: "\$ ",
                    labelText: "Amount",
                  ),
                ),
              ),

              DropdownButton<Category>(
                value: selectedCategory,
                underline: SizedBox(), // 🚀 removes line
                icon: Icon(Icons.keyboard_arrow_down),
                style: TextStyle(fontSize: 16, color: Colors.black),
                borderRadius: BorderRadius.circular(50),
                items: Category.values.map((c) {
                  return DropdownMenuItem(
                    //
                    value: c,
                    child: Padding(
                      //
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Text(c.name),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value!;
                  });
                },
              ),
            ],
          ),

          SizedBox(height: 20),

          // ===============================
          //  3rd row
          // ===============================
          Row(
            children: [
              TextButton(
                //
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
              ElevatedButton(
                //
                onPressed: () {
                  widget.addNewExpense(
                    Expense(
                      title: _titleController.text,
                      amount: double.parse(_amountController.text),
                      category: selectedCategory!,
                      date: selectedDate!,
                    ),
                  );
                  Navigator.pop(context);
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
