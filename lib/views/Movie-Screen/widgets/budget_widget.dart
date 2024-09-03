import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BudgetWidget extends StatelessWidget {
  String? budget;
  BudgetWidget({super.key, required this.budget});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Budget : ',
          style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w300),
        ),
        Text(
          budget.toString(),
          style: GoogleFonts.poppins(fontSize: 15, color: Colors.black,fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
