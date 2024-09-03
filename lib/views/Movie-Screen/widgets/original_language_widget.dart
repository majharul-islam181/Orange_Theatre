import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OriginalLanguageWidget extends StatelessWidget {
  String? originalLanguage;
   OriginalLanguageWidget({super.key, required this.originalLanguage});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Original Language : ',
          style: GoogleFonts.poppins(fontSize: 15, color: Colors.black,fontWeight: FontWeight.w300),
        ),
        Text(
          originalLanguage.toString(),
          style: GoogleFonts.poppins(fontSize: 15,color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
