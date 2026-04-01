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
  Category? selectedCategory;
  DateTime? selectedDate;

  void _openDatePicker() async {
    final DateTime now = DateTime.now();
    final DateTime firstDate = DateTime(now.year - 5, now.month, now.day);

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: now,
      initialDate: now,
    );

    setState(() {
      selectedDate = pickedDate;
    });
  }

  void _addNewExpense() {
    final title = _titleController.text;
    final amount = double.tryParse(_amountController.text);

    if (
    //
    title.isEmpty ||
        amount == null ||
        selectedCategory == null ||
        selectedDate == null
    //
    ) {
      //
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text("Invalid Options"),
            content: const Text("Make sure all options are provided and valid"),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.pop(ctx),
                child: Text("Ok"),
              ),
            ],
          );
        },
      );

      return;
    }

    print("adding expense");

    widget.addNewExpense(
      Expense(
        title: title,
        amount: amount,
        category: selectedCategory!,
        date: selectedDate!,
      ),
    );
    Navigator.pop(context);
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
      padding: const EdgeInsets.all(16),
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
                  decoration: const InputDecoration(labelText: "Title"),
                ),
              ),
              TextButton.icon(
                onPressed: _openDatePicker,
                label: Text(
                  selectedDate != null
                      ? dateFormatter.format(selectedDate!)
                      : "Select Date",
                ),
                icon: const Icon(Icons.calendar_month),
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
                  decoration: const InputDecoration(
                    //
                    prefixText: "\$ ",
                    labelText: "Amount",
                  ),
                ),
              ),

              DropdownButton<Category>(
                value: selectedCategory,
                underline: const SizedBox(), // 🚀 removes line
                icon: const Icon(Icons.keyboard_arrow_down),
                style: const TextStyle(fontSize: 16, color: Colors.black),
                borderRadius: BorderRadius.circular(50),
                items: Category.values.map((c) {
                  return DropdownMenuItem(
                    //
                    value: c,
                    child: Padding(
                      //
                      padding: const EdgeInsets.symmetric(horizontal: 24),
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

          const SizedBox(height: 20),

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
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                //
                onPressed: _addNewExpense,
                child: const Text("Submit"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
