import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';

// Project Files
import 'package:expense_tracker/data_models/expense.dart';

class ExpenseItems extends StatefulWidget {
  const ExpenseItems(this.expense, {super.key});

  final Expenses expense;

  @override
  State<ExpenseItems> createState() {
    return _ExpenseItemsState();
  }
}

class _ExpenseItemsState extends State<ExpenseItems> {
  @override
  Widget build(context) {
    return Card.filled(
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: HexColor("B67352"),
          width: 0.9,
        ),
      ),
      margin: EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 6,
      ),
      elevation: 2,
      color: HexColor("B67352"),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.expense.title,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    color: HexColor("F5FEFD"),
                  ),
                ),
                SizedBox(
                  height: 45,
                  width: 45,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: HexColor("F5FEFD"),
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      categoryIcons[widget.expense.category],
                      color: HexColor("F5FEFD"),
                      // size: 28,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                // 70.00 -> 70 with the help of toStringAtFixed(values)
                Text(
                  "₹ ${widget.expense.amount.toStringAsFixed(0)}",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: HexColor("F5FEFD"),
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      widget.expense.formatedDate,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: HexColor("F5FEFD"),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
