import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

// to generate unique id
const uuid = Uuid();

// to Formate date
final formatter = DateFormat("yyyy-MM-dd");

// combination of predefined values
enum Category { food, travel, leisure, work }

// icons based on Category
const categoryIcons = {
  Category.food: Icons.food_bank_outlined,
  Category.leisure: Icons.movie_creation_outlined,
  Category.travel: Icons.travel_explore_outlined,
  Category.work: Icons.work_history_outlined,
};

class Expenses {
  Expenses(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4(); //<- initializer list

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formatedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expense});

  ExpenseBucket.forCategory(List<Expenses> allExpenses, this.category)
      : expense = allExpenses
            .where((expense) => expense == expense.category)
            .toList();

  final Category category;
  final List<Expenses> expense;
  

  double get totalExpenses {
    double sum = 0;

    for (final expense in expense) {
      sum += expense.amount;
    }
    return sum;
  }
}
