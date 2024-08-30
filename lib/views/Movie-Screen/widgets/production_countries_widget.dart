import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductionCountriesWidget extends StatelessWidget {
  final List<String> countries;

  const ProductionCountriesWidget({
    Key? key,
    required this.countries,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Production Countries: ',
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        Expanded(
          child: Text(
            countries.join(', '),
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
