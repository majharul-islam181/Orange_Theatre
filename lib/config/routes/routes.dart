
import 'package:flutter/material.dart';
import 'package:orange_theatre/views/Movie-Screen/movie_screen.dart';
import 'package:orange_theatre/views/SplashScreen/splashscreen.dart';

import 'routes_name.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final int movieId = settings.arguments as int;
    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());

       case RoutesName.movieScreenDetails:
        return MaterialPageRoute(
            builder: (BuildContext context) =>  MovieScreen(movieId: movieId));

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
