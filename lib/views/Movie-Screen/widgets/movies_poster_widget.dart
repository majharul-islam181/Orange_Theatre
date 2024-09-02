// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:orange_theatre/config/app_url.dart';

class MoviesPosterWidget extends StatelessWidget {
  String? backdropPath;
  MoviesPosterWidget({super.key, required this.backdropPath});

  @override
  Widget build(BuildContext context) {
    // Check if the backdrop path is valid
    if (backdropPath == null || backdropPath!.isEmpty) {
      return _buildPlaceholderImage(
          context); // Return a placeholder image if the path is invalid
    }

    final imageUrl = AppUrl.imageBaseUrl + backdropPath!; // Construct URL
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(220),
            bottomRight: Radius.circular(1),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(220),
            bottomRight: Radius.circular(1),
          ),
          child: Image.network(
            AppUrl.imageBaseUrl + backdropPath.toString(),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholderImage(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        color: Colors.grey[300], // Placeholder background color
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(220),
          bottomRight: Radius.circular(1),
        ),
      ),
      child: const Center(
        child: Icon(
          Icons.image_not_supported, // Icon to indicate a missing image
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
