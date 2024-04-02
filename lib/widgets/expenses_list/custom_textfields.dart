// main Files
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:hexcolor/hexcolor.dart";
// Project files
import 'package:expense_tracker/data_models/expense.dart';

// create a separate textfield so i can use in my expense tracker
Widget expenseTitleTextField(_expenseTitleFieldController) {
  return TextField(
    controller: _expenseTitleFieldController,
    maxLength: 50,
    cursorColor: HexColor("B67352"),
    style: TextStyle(
        color: HexColor("B67352"),
        decoration: TextDecoration.none,
        decorationThickness: 0),
    decoration: InputDecoration(
      border: const OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: HexColor("B67352"),
          width: 1.4,
        ),
      ),
      label: Text(
        "Expense title",
        style: GoogleFonts.poppins(
          fontSize: 16,
          color: HexColor("B67352"),
        ),
      ),
    ),
  );
}

Widget expenseAmountTextField(_amountFieldController) {
  return TextField(
    keyboardType: TextInputType.number,
    controller: _amountFieldController,
    // maxLength: 50,
    cursorColor: HexColor("B67352"),
    style: TextStyle(
      color: HexColor("B67352"),
    ),
    decoration: InputDecoration(
      prefixText: "₹ ",
      prefixStyle: TextStyle(
        color: HexColor("B67352"),
        fontSize: 16,
      ),
      border: const OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: HexColor("B67352"),
          width: 1.4,
        ),
      ),
      label: Text(
        "Amount",
        style: GoogleFonts.poppins(
          fontSize: 16,
          color: HexColor("B67352"),
        ),
      ),
    ),
  );
}

Widget expenseDatePicker(
  _openDatePicker,
  _selectedDate,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        _selectedDate == null
            ? "Select Date"
            : formatter.format(_selectedDate!),
        style: GoogleFonts.poppins(
          // fontSize: 14,
          color: HexColor("B67352"),
        ),
      ),
      IconButton(
        onPressed: _openDatePicker,
        icon: Icon(
          Icons.date_range,
          color: HexColor("A35E52"),
        ),
      )
    ],
  );
}

Widget expenseTypeDropDowns(_selectedDropdownItem, _DisplayDropdownValues) {
  return DropdownButton(
    isExpanded: true,
    icon: Icon(
      Icons.arrow_drop_down_circle_outlined,
      color: HexColor("B67352"),
      // size: 26,
    ),
    // borderRadius: BorderRadius.zero,
    // dropdownColor: HexColor("B67352"),
    value: _selectedDropdownItem,
    items: Category.values
        .map(
          (category) => DropdownMenuItem(
            value: category,
            child: Text(
              category.name.toLowerCase(),
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: HexColor("B67352"),
              ),
            ),
          ),
        )
        .toList(),
    onChanged: (value) => _DisplayDropdownValues(value),
  );
}

Widget cancelButton(context) {
  return OutlinedButton(
    style: OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 10,
      ),
      side: BorderSide(
        color: HexColor("A35E52"),
        width: 1.5,
      ),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
    child: Text(
      "Cancel",
      style: GoogleFonts.poppins(
        fontSize: 16,
        color: HexColor("A35E52"),
      ),
    ),
  );
}

Widget submitButton(_submitNewExpense) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: HexColor("A35E52"),
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 10,
      ),
      elevation: 5,
    ),
    onPressed: _submitNewExpense,
    child: Text(
      "Create",
      style: GoogleFonts.poppins(
        fontSize: 16,
        color: HexColor("F5FEFD"),
      ),
    ),
  );
}
