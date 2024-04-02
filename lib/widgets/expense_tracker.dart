// main files
import 'package:expense_tracker/widgets/add_new_expense.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
// Project files
import 'package:expense_tracker/widgets/expenses_list/expense_list.dart';
import 'package:expense_tracker/data_models/expense.dart';

class ExpenseTracker extends StatefulWidget {
  const ExpenseTracker({super.key});

  @override
  State<ExpenseTracker> createState() {
    return _ExpenseTrackerState();
  }
}

class _ExpenseTrackerState extends State<ExpenseTracker> {
  var width;

  // // make private list of Expense, in this expense i'd add some data
  final List<Expenses> _registeredExpense = [];

  // User created new Expense
  void _addExpense(Expenses expenses) {
    setState(() {
      _registeredExpense.add(expenses);
    });
  }

  // When User Swap left or right Expense list will be removed
  void _removeExpense(Expenses expenses) {
    final expenseIndex = _registeredExpense.indexOf(expenses);
    setState(() {
      _registeredExpense.remove(expenses);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        // margin: Theme.of(context).cardTheme.margin,
        content: Text(
          "${expenses.title} Deleted",
          style: GoogleFonts.poppins(
            color: HexColor("#FFFFFF"),
            fontSize: 15,
          ),
        ),
        duration: Duration(seconds: 5),
        action: SnackBarAction(
          label: "UNDO",
          onPressed: () {
            setState(() {
              _registeredExpense.insert(
                expenseIndex,
                expenses,
              );
            });
          },
          textColor: HexColor("#FFFFFF"),
        ),
        backgroundColor: HexColor("A35E52"),
        padding: EdgeInsets.symmetric(horizontal: 10),
      ),
    );
  }

  // add expense(Popup or overlay)
  void _openExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return AddNewExpense(
          onAddExpense: _addExpense,
        );
      },
      backgroundColor: HexColor("#F6F5F5"),
      shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.all(Radius.zero),
      ),
    );
  }

  @override
  Widget build(context) {
    width = MediaQuery.of(context).size.width;

    print(width);
    Widget? mainContent;

    //  if Static list will be removed by user or by me than or list of expense is not empty then it will show
    if (_registeredExpense.isNotEmpty) {
      mainContent = ExpenseList(
        expenses: _registeredExpense,
        onRemovedExpense: _removeExpense,
      );
    } else {
      // if no Expense will display this message will display instead
      mainContent = Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 15,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Wanted to Add New Expense?",
                style: GoogleFonts.poppins(
                  fontSize: 35,
                  color: HexColor("A35E52"),
                  letterSpacing: 4.7,
                ),
                // textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 6,
                      ),
                      side: BorderSide(
                        color: HexColor("A35E52"),
                        width: 2.5,
                      ),
                    ),
                    onPressed: _openExpenseOverlay,
                    child: Text(
                      "Add",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: HexColor("A35E52"),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Expense Tracker",
          style: GoogleFonts.poppins(
            color: HexColor("A35E52"),
            fontSize: 28,
          ),
        ),
        actions: [
          IconButton(
            onPressed: _openExpenseOverlay,
            icon: Icon(
              Icons.add_circle_outline,
              color: HexColor("A35E52"),
              size: 28,
            ),
          )
        ],
      ),
      body: (width < 450)
          ? Column(
              children: [
                Expanded(
                  child: mainContent,
                ),
              ],
            )
          : Container(
              margin: Theme.of(context).cardTheme.margin,
              child: Row(
                children: [
                  Expanded(
                    child: mainContent,
                  ),
                ],
              ),
            ),
    );
  }
}
