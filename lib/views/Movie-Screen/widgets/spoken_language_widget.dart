import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpokenLanguageWidget extends StatelessWidget {
  final List<String> languages;

  const SpokenLanguageWidget({
    Key? key,
    required this.languages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Spoken Language : ',
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w300,
          ),
        ),
        Text(
          languages.join(', '),
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
