// Main FIles
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

// project Files
import 'package:expense_tracker/data_models/expense.dart';

class AddNewExpense extends StatefulWidget {
  const AddNewExpense({super.key, required this.onAddExpense});

  final void Function(Expenses) onAddExpense;

  @override
  State<AddNewExpense> createState() {
    return _AddNewExpense();
  }
}

class _AddNewExpense extends State<AddNewExpense> {
  final _expenseTitleFieldController = TextEditingController();
  final _amountFieldController = TextEditingController();
  DateTime? _selectedDate;
  var _selectedDropdownItem = Category.leisure;

  // show date on overlay
  void _openDatePicker() async {
    final currentDate = DateTime.now();
    final firstDate = DateTime(
      currentDate.year - 1,
      currentDate.month,
      currentDate.day,
    );
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: firstDate,
      lastDate: currentDate,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  // set and get value of Dropdown
  void _DisplayDropdownValues(value) {
    if (value == null) {
      return;
    }
    setState(() {
      _selectedDropdownItem = value;
    });
  }

  // Form Validation check if expense title or number or date is Empty
  void _submitNewExpense() {
    final enteredAmount = double.tryParse(_amountFieldController.text);
    // final amountInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_expenseTitleFieldController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          content: Text(
            "Expense Field Cant Be Empty",
            style: GoogleFonts.poppins(
              fontSize: 20,
              color: HexColor("B67352"),
            ),
          ),
          actions: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                side: BorderSide(
                  color: HexColor("B67352"),
                  width: 1.5,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "OK",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: HexColor("B67352"),
                ),
              ),
            ),
          ],
        ),
      );
    } else if (enteredAmount == null || enteredAmount <= 0) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          content: Text(
            "Amount Can't be Empty or Negative",
            style: GoogleFonts.poppins(
              fontSize: 20,
              color: HexColor("B67352"),
            ),
          ),
          actions: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                side: BorderSide(
                  color: HexColor("B67352"),
                  width: 1.5,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "OK",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: HexColor("B67352"),
                ),
              ),
            ),
          ],
        ),
      );
    } else if (_selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          content: Text(
            "Date is Not Selected",
            style: GoogleFonts.poppins(
              fontSize: 20,
              color: HexColor("B67352"),
            ),
          ),
          actions: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                side: BorderSide(
                  color: HexColor("B67352"),
                  width: 1.5,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "OK",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: HexColor("B67352"),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      widget.onAddExpense(
        Expenses(
            title: _expenseTitleFieldController.text,
            amount: enteredAmount,
            date: _selectedDate!,
            category: _selectedDropdownItem),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(context) {
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 50,
            horizontal: 17,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Add a New Expense.",
                style: GoogleFonts.poppins(
                  // fontWeight: FontWeight.w500,
                  fontSize: 45,
                  color: HexColor("A35E52"),
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
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
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
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
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    // flex: 2,
                    child: Row(
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
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              DropdownButton(
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
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Spacer(),
                  OutlinedButton(
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
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
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
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

// Destroy the textEditingController at the end
  @override
  void dispose() {
    _expenseTitleFieldController.dispose();
    _amountFieldController.dispose();
    super.dispose();
  }
}
