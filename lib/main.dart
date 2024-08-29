import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:orange_theatre/repository/trending_movies/trending_movies_http_api_repository.dart';
import 'package:orange_theatre/repository/trending_movies/trending_movies_repository.dart';
import 'views/views.dart';

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
      home: const RootApp(),
    );
  }
}

void servicesLocator() {
  getIt.registerLazySingleton<TrendingMoviesRepository>(
      () => TrendingMoviesHttpApiRepository());
}
