import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    Key? key,
    required this.expenses,
  }) : super(key: key);

  final List<Expense> expenses;

  Widget _buildExpenseItem(BuildContext context, int index) {
    return ExpenseItem(expense: expenses[index]);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: _buildExpenseItem,
    );
  }
}
