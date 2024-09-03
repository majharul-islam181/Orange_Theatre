import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:orange_theatre/bloc/theme/theme_switcher_bloc.dart';
import 'package:orange_theatre/bloc/theme/theme_switcher_event.dart';
import 'package:orange_theatre/config/routes/routes.dart';
import 'package:orange_theatre/models/favourite/favourite_model_hive.dart';
import 'package:orange_theatre/views/OnBoardingScreen/onboarding_page.dart';
import 'repository/repository.dart';
import 'package:path_provider/path_provider.dart';

//Depency Injection
GetIt getIt = GetIt.instance;
void main() async {
  //if widget got any error
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return const Center(child: Text('Something went wrong!'));
  };
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(FavouriteModelHiveAdapter());
  await Hive.openBox<FavouriteModelHive>('favouritesBox');
  servicesLocator();
  runApp(BlocProvider(
    create: (context) => ThemeSwitcherBloc()..add(SetInitialTheme()),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeSwitcherBloc, ThemeData>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Orange Theatre',
          theme: state,
          onGenerateRoute: Routes.generateRoute,
          home: const OnBoardingPage(),

        );
      },
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
