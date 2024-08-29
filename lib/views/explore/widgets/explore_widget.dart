// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../config/colors/color.dart';

class ExploreWidget extends StatelessWidget {
  String? imageUrl;
  String? movieTitle;
  String? releaseDate;
  String? genre;
  ExploreWidget(
      {required this.imageUrl,
      required this.movieTitle,
      required this.releaseDate,
      required this.genre,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
      child: Container(
        width: MediaQuery.of(context).size.width * 9,
        // height: 290,
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
            ]),
        child: Stack(
          children: [
            //image thakbe ekhne
            SizedBox(
              width: double.infinity,
              height: 200,
              child: CachedNetworkImage(
                imageBuilder: (contex, ImageProvider) => Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: ImageProvider,
                        fit: BoxFit.cover,
                      )),
                ),
                imageUrl: imageUrl.toString(),
              ),
            ),
            //  Positioned(
            //   top: 165,
            //   right: 15,
            //   child: BookmarkBox(onTap: onBookmark, isBookmarked: data['is_favorited'],),

            // ),
            //attribute
            Positioned(
                top: 215,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movieTitle.toString(),
                        maxLines: 1,
                        // data["name"],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          getAttribute(Icons.sell_outlined, releaseDate.toString(),
                              AppColor.labelColor),
                          getAttribute(Icons.play_circle_outline, "session",
                              AppColor.labelColor),
                          getAttribute(Icons.schedule_outlined, "duration",
                              AppColor.labelColor),
                          getAttribute(
                              Icons.star, genre.toString(), AppColor.yellow),
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  getAttribute(IconData icon, String name, Color color) {
    return Row(
      children: [
        Icon(
          icon,
          size: 10,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          name,
          style: TextStyle(
            fontSize: 13,
            color: color,
          ),
        )
      ],
    );
  }
}
