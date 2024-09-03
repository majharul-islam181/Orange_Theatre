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
     this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  movieTitle.toString(),
                  maxLines: 1,
                  style: GoogleFonts.poppins(
                      fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                child: Container(
                    height: MediaQuery.of(context).size.height * .04,
                    width: MediaQuery.of(context).size.width * .25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      // color: Colors.blueAccent,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                       
                        TextButton(
                            onPressed: () {},
                            child: Image.asset(
                              'assets/icons/internet.png',
                              height: 20,
                              color: Colors.black,
                            )),
                      ],
                    )),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(movieOverview.toString(),
              style: GoogleFonts.poppins(
                  fontSize: 13, color: Colors.black,fontWeight: FontWeight.w300)),
        ],
      ),
    );
  }
}
