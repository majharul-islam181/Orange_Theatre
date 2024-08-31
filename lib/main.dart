import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:orange_theatre/config/routes/routes.dart';
import 'package:orange_theatre/views/Movie-Screen/movie_screen.dart';
import 'package:orange_theatre/views/RootApp/rootapp_screen.dart';
import 'repository/movie_details/movie_repository.dart';
import 'repository/repository.dart';

//Depency Injection
GetIt getIt = GetIt.instance;
void main() {
  servicesLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Orange Theatre',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: Routes.generateRoute,
      home: const RootApp(),
      // home: const MovieScreen(),
    );
  }
}

void servicesLocator() {
  getIt.registerLazySingleton<TrendingMoviesRepository>(
      () => TrendingMoviesHttpApiRepository());
  getIt.registerLazySingleton<UpcomingMoviesRepository>(
      () => UpcomingMoviesHttpApiRepository());
  getIt.registerLazySingleton<MovieRepository>(
      () => MovieHttpApiRepository());
}
