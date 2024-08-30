
import 'package:flutter/material.dart';
import 'package:orange_theatre/views/Movie-Screen/movie_screen.dart';

import 'routes_name.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final int movieId = settings.arguments as int;
    switch (settings.name) {
      // case RoutesName.splashScreen:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const SplashScreen());

      // case RoutesName.rootScreen:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const RootApp());

      // case RoutesName.loginScreen:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const LoginScreen());

      // case RoutesName.addRoom:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const AddRoomPage());

      // case RoutesName.addCategory:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const AddCategory());

      // case RoutesName.deleteCategory:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const DeleteCategory());

      // case RoutesName.deleteRoom:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const DeleteRoom());

      // case RoutesName.pendingRequest:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const PendingRequest());

      // case RoutesName.bookingDetails:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const AllBookingsScreen());

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
