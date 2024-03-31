import 'package:expense_tracker/widgets/expenses_list/expense_items.dart';
import 'package:flutter/material.dart';
// Project Files
import 'package:expense_tracker/data_models/expense.dart';


class ExpenseList extends StatelessWidget {
  ExpenseList(
      {super.key, required this.expenses, required this.onRemovedExpense});

  // create a variable that will pass in argument in ExpenseList, and when i call ExpenseList that time i have to pass this as a named parameter
  final List<Expenses> expenses;
  final void Function(Expenses expense) onRemovedExpense;

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(expenses[index]),
        child: ExpenseItems(expenses[index]),
        onDismissed: (direction) => onRemovedExpense(expenses[index]),
        direction: DismissDirection.endToStart,
      ),
    );
  }
}
