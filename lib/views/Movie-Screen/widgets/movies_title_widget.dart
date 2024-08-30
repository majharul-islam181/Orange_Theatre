import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MoviesTitleWidget extends StatelessWidget {
  String? movieTitle;
  String? movieOverview;
 MoviesTitleWidget({super.key, required this.movieTitle, required this.movieOverview});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movieTitle.toString(),
            style:
                GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(movieOverview.toString(),
              style: GoogleFonts.poppins(
                  fontSize: 10, fontWeight: FontWeight.w300)),
        ],
      ),
    );
  }
}
