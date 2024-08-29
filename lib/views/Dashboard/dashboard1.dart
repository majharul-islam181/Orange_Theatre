import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:orange_theatre/views/Dashboard/widgets/trending_movieList_widgets.dart';

class Dashboard1 extends StatefulWidget {
  const Dashboard1({super.key});

  @override
  State<Dashboard1> createState() => _Dashboard1State();
}

class _Dashboard1State extends State<Dashboard1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Ensures the body is behind the AppBar
      appBar: AppBar(
        title: const Text(
          "Orange Theatre",
          style: TextStyle(
            fontFamily: 'Netflix',
            fontSize: 30,
            fontWeight: FontWeight.w800,
            color: Colors.orange,
            letterSpacing: 4,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0, // Removes the shadow
      ),
      body: Stack(
        children: [
          // Content
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 100), // To give space below the AppBar
                TrendingMovielistWidgets(
                  movieTitle: "Movie title",
                  movieRelaseDate: "12/1/1",
                  movieGenre: "new",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
