import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:orange_theatre/config/routes/routes.dart';
import 'package:orange_theatre/repository/genre/genre_http_api_repository.dart';
import 'package:orange_theatre/repository/genre/genre_repository.dart';
import 'package:orange_theatre/views/RootApp/rootapp_screen.dart';
import 'repository/movie_details/movie_repository.dart';
import 'repository/repository.dart';

//Depency Injection
GetIt getIt = GetIt.instance;
void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load(fileName: ".env");

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
      // home:  NearbyTheatersScreen(),
    );
  }
}

void servicesLocator() {
  getIt.registerLazySingleton<TrendingMoviesRepository>(
      () => TrendingMoviesHttpApiRepository());
  getIt.registerLazySingleton<UpcomingMoviesRepository>(
      () => UpcomingMoviesHttpApiRepository());
  getIt.registerLazySingleton<MovieRepository>(() => MovieHttpApiRepository());
  getIt.registerLazySingleton<GenreRepository>(() => GenreHttpApiRepository());
}
