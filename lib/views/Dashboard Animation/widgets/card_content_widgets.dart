import 'package:flutter/material.dart';

class CardContent extends StatelessWidget {
  final String movieName;
  final String releaseDate;
  final String rating;

  const CardContent({
    super.key,
    required this.movieName,
    required this.releaseDate,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  movieName,
                  style: const TextStyle(fontSize: 17, color: Colors.black),
                  maxLines: 1,
                ),
                const SizedBox(height: 2),
                Text(
                  releaseDate,
                  style: const TextStyle(fontSize: 10, color: Colors.black),
                ),
                const Spacer(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/star.png',
                  height: 18,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  rating,
                  style: const TextStyle(color: Colors.black, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
