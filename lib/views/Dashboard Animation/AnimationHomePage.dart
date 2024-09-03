// ignore_for_file: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_theatre/bloc/theme/theme_switcher_bloc.dart';
import 'package:orange_theatre/bloc/theme/theme_switcher_event.dart';
import 'package:orange_theatre/views/Dashboard%20Animation/tabs/tabs_for_trending_movies.dart';
import 'package:orange_theatre/views/Dashboard%20Animation/top_upcoming_movies.dart';
import 'top_trending_movies.dart';
import 'tabs/tabs_for_upcoming_movies.dart';

class AnimationHomePage extends StatelessWidget {
  const AnimationHomePage({super.key});

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
        // backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          BlocBuilder<ThemeSwitcherBloc, ThemeData>(builder: (context, state) {
            return Transform.scale(
              scale: 0.7,
              child: CupertinoSwitch(
                  value: state == ThemeData.dark(),
                  onChanged: (bool value) {
                    // print(value);
                    context.read<ThemeSwitcherBloc>().add(ThemeSwitching());
                  }),
            );
          })
        ],
      ),
      body: const Stack(
        children: <Widget>[
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 10),
                  TabsForTrendingMovies(),
                  SizedBox(height: 8),
                  TopTrendingMovies(),
                  SizedBox(height: 20),
                  TabsForUpcomingMovies(),
                  TopUpcomingMovies(),
                  SizedBox(height: 10),
                  // SettingsPage()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
