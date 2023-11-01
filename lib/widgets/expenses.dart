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
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final index = _registeredExpenses.indexOf(expense);

    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense removed!'),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(
              () {
                _registeredExpenses.insert(index, expense);
              },
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expenses Found!'),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

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
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
