// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MoviesRatingWidget extends StatelessWidget {
  String? voteAverage;
  MoviesRatingWidget({super.key, required this.voteAverage});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: MediaQuery.of(context).size.height * .3,
        right: 16,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/icons/review.svg',
                height: 20,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                voteAverage.toString(),
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ));
  }
}
