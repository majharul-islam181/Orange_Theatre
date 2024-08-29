import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orange_theatre/models/upcoming_movies/upcoming_movies_model.dart';
import '../../config/colors/color.dart';
import 'custom_image.dart';

class TopUpcomingItem extends StatelessWidget {
  const TopUpcomingItem({
    super.key,
    required this.data,
    this.width = 280,
    this.height = 300,
    this.onTap,
  });

 final MovieResult data;
  final double width;
  final double height;
  final GestureTapCallback? onTap;

  static String imageUrl = "https://image.tmdb.org/t/p/w500";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(2),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(),
            const SizedBox(height: 2),
            _buildText(),
          ],
        ),
      ),
    );
  }

  Widget _buildText() {
    return Container(
      width: width - 10,
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildName(),
          const SizedBox(height: 2),
          _buildInfo(),
        ],
      ),
    );
  }

  Widget _buildName() {
    return Text(
      data.originalTitle,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.poppins(
        fontSize: 16,
        color: AppColor.textColor,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Releas Date: ${data.releaseDate}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  color: AppColor.labelColor,
                  fontSize: 13,
                )),
            Row(
              children: [
                Text(
                  'Genre: ',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                  ),
                ),
                Text(
                  data.genreIds.join(', '),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColor.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildImage() {
    return CustomImage(
      '$imageUrl${data.posterPath}',
      width: double.infinity,
      height: 235,
      radius: 15,
    );
  }
}
