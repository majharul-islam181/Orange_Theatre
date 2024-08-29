import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orange_theatre/bloc/trending_movies_bloc/trending_movies_bloc.dart';
import 'package:orange_theatre/main.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late TrendingMoviesBloc trendingMoviesBloc;

  @override
  void initState() {
    super.initState();
    trendingMoviesBloc = TrendingMoviesBloc(trendingMoviesRepository: getIt());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Text(
                'Trending Movies',
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                width: double.infinity,
                child: CarouselSlider.builder(
                    itemCount: 10,
                    itemBuilder: (context, index, state) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(image: NetworkImage("")),
                        ),
                      );
                    },
                    options: CarouselOptions()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
