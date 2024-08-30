import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ReleaseRevenuePopularityWidget extends StatelessWidget {
  String? movieRelesedate;
  String? movieRevenue;
  String? moviePopularity;
  ReleaseRevenuePopularityWidget(
      {super.key,
      required this.movieRelesedate,
      required this.movieRevenue,
      required this.moviePopularity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Row(
              children: [
                const Icon(
                  Icons.new_releases,
                  color: Colors.red,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  movieRelesedate.toString(),
                  style: GoogleFonts.poppins(
                      fontSize: 13, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/ecommerce-money-svgrepo-com.svg',
                  height: 20,
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  movieRevenue.toString(),
                  style: GoogleFonts.poppins(
                      fontSize: 13, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Expanded(
              child: Row(
            children: [
              SvgPicture.asset(
                'assets/icons/fire.svg',
                height: 25,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                moviePopularity.toString(),
                style: GoogleFonts.poppins(
                    fontSize: 13, fontWeight: FontWeight.w400),
              )
            ],
          )),
        ],
      ),
    );
  }
}
