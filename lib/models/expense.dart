import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

enum Category {
  food,
  clothing,
  travel,
  tech,
}

const categoryIcons = {
  Category.food: Icons.fastfood,
  Category.clothing: Icons.shopping_bag,
  Category.travel: Icons.flight,
  Category.tech: Icons.computer,
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String title;
  final double amount;
  final String id;
  final DateTime date;
  final Category category;

  String get getDate {
    return formatter.format(date);
  }
}
