// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MoviesTitleWidget extends StatelessWidget {
  String? movieTitle;
  String? movieOverview;
  void Function()? onPressed;
  MoviesTitleWidget({
    super.key,
    required this.movieTitle,
    required this.movieOverview,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                movieTitle.toString(),
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Container(
                  height: MediaQuery.of(context).size.height * .04,
                  width: MediaQuery.of(context).size.width * .25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    // color: Colors.blueAccent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/icons/internet.png',
                        height: 20,
                        color: Colors.black,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Visit us',
                            style: TextStyle(fontSize: 15),
                          )),
                    ],
                  ))
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(movieOverview.toString(),
              style: GoogleFonts.poppins(
                  fontSize: 13, fontWeight: FontWeight.w300)),
        ],
      ),
    );
  }
}
