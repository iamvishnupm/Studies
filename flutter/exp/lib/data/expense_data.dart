import "package:exp/models/expense.dart";

final data = [
  {
    'title': 'Burger',
    'amount': 120.50,
    'date': '2026-03-28',
    'category': 'food',
  },
  {
    'title': 'Bus Ticket',
    'amount': 45,
    'date': '2026-03-29',
    'category': 'travel',
  },
  {
    'title': 'Flutter Course',
    'amount': 999.99,
    'date': '2026-03-30',
    'category': 'study',
  },
  {
    'title': 'Movie Night',
    'amount': 300,
    'date': '2026-03-31',
    'category': 'fun',
  },
];

List<Expense> expenseList = Expense.fromData(data);
