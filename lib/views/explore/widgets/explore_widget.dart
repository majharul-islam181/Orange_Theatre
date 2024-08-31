import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../config/colors/color.dart';

class ExploreWidget extends StatelessWidget {
  final String? imageUrl;
  final String? movieTitle;
  final String? releaseDate;
  final String? genre;

  const ExploreWidget({
    required this.imageUrl,
    required this.movieTitle,
    required this.releaseDate,
    required this.genre,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 15, right: 15),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * .34,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(top: 5, bottom: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColor.withOpacity(.1),
              blurRadius: 1,
              spreadRadius: 1,
              offset: const Offset(1, 1),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Image placeholder
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .24,
              child: CachedNetworkImage(
                imageUrl: imageUrl ?? '',
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            // Movie attributes
            Positioned(
              top: MediaQuery.of(context).size.height * .25,
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movieTitle ?? 'Unknown Title',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getAttribute(
                          Icons.date_range_outlined,
                          releaseDate ?? 'Unknown Date',
                          AppColor.labelColor,
                        ),
                        getAttribute(
                          Icons.star,
                          genre ?? 'Unknown Genre',
                          AppColor.red,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getAttribute(IconData icon, String name, Color color) {
    return Row(
      children: [
        Icon(icon, size: 10),
        const SizedBox(width: 5),
        Text(
          name,
          style: TextStyle(
            fontSize: 13,
            color: color,
          ),
        ),
      ],
    );
  }
}
