import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:orange_theatre/bloc/theme/theme_switcher_bloc.dart';
import 'package:orange_theatre/bloc/theme/theme_switcher_event.dart';
import 'package:orange_theatre/config/routes/routes.dart';
import 'package:orange_theatre/models/favourite/favourite_model_hive.dart';
import 'package:orange_theatre/views/OnBoardingScreen/onboarding_page.dart';
import 'package:orange_theatre/views/RootApp/rootapp_screen.dart';
import 'repository/repository.dart';
import 'package:path_provider/path_provider.dart';

//Depency Injection
GetIt getIt = GetIt.instance;
void main() async {
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Center(child: Text('Something went wrong!'));
  };
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(FavouriteModelHiveAdapter());
  await Hive.openBox<FavouriteModelHive>('favouritesBox');
  // await dotenv.load(fileName: ".env");
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
        // final themeData = state is DarkThemeState
        //     ? ThemeData.dark()
        //     : ThemeData.light();

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Orange Theatre',
          theme: state,
          // theme: themeData.copyWith(
          //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          //   useMaterial3: true,
          // ),
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
