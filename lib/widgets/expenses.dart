import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';


class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: "Pizza",
      amount: 2.99,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: "Asus Laptop",
      amount: 99.99,
      date: DateTime.now(),
      category: Category.tech,
    ),
    Expense(
      title: "Travel to Paris",
      amount: 299.99,
      date: DateTime.now(),
      category: Category.travel,
    ),
  ];

  void _openAddExpenseModal() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const NewExpense(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            title: const Text('Expense Tracker'),
            actions: [
              IconButton(
                onPressed: _openAddExpenseModal,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          const Text('The chart'),
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses),
          ),
        ],
      ),
    );
  }
}
