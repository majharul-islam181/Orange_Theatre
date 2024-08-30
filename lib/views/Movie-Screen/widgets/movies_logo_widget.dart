import 'package:flutter/material.dart';
import 'package:orange_theatre/config/app_url.dart';

class MoviesLogoWidget extends StatelessWidget {
  String? posterPath;
   MoviesLogoWidget({super.key, required this.posterPath});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: MediaQuery.of(context).size.height * .22,
        left: 30,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            AppUrl.imageBaseUrl + posterPath.toString(),
            height: 140,
            width: 100,
            fit: BoxFit.cover,
          ),
        ));
  }
}
