import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoBoolWidget extends StatelessWidget {
  IconData? icon;
  Color? color;
   VideoBoolWidget({super.key, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Video :",
          style: GoogleFonts.poppins(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          width: 5,
        ),
        Icon(
          Icons.cancel_sharp,
          color: Colors.red[300],
        )
      ],
    );
  }
}
