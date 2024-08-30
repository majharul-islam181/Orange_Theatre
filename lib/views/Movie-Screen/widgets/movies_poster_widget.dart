// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:orange_theatre/config/app_url.dart';

class MoviesPosterWidget extends StatelessWidget {
  String? backdropPath;
  MoviesPosterWidget({super.key, required this.backdropPath});

  @override
  Widget build(BuildContext context) {
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
}
