import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TrendingMovielistWidgets extends StatelessWidget {
  String? movieTitle;
  String? movieRelaseDate;
  String? movieGenre;
 TrendingMovielistWidgets({super.key,
  required this.movieTitle,
  required this.movieRelaseDate,
  required this.movieGenre,
  
  
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: 10,
        itemBuilder: (context, itemIndex, pageViewIndex) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: Stack(
              children: [
                // Background Image
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/slider_image_$itemIndex.jpg'), // Replace with your image paths
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: 300,
                  width: double.infinity,
                ),
                // Text Overlay
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.6),
                        Colors.transparent,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                      movieTitle.toString(), // Example text, you can change this
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          movieRelaseDate.toString() ,// Example description, you can change this
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                         movieGenre.toString(), // Example description, you can change this
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        options: CarouselOptions(
          height: 300,
          autoPlay: true,
          viewportFraction: 0.55,
          enlargeCenterPage: true,
          pageSnapping: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(seconds: 1),
        ),
      ),
    );
  }
}
