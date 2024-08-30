// ignore_for_file: public_member_api_docs, sort_constructors_first, use_super_parameters, must_be_immutable
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OriginCountryWidget extends StatelessWidget {
  String? originCountry;

   OriginCountryWidget({
    Key? key,
     required this.originCountry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
                          children: [
                            Text(
                              'Origin Country :  ',
                              style: GoogleFonts.poppins(
                                  fontSize: 15, fontWeight: FontWeight.w300),
                            ),
                            Text(
                              originCountry.toString(),
                              style: GoogleFonts.poppins(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          ],
                        );
  }
}
