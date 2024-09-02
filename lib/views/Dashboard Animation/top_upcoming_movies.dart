import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_theatre/bloc/upcoming_movies_bloc/upcoming_movies_bloc.dart';
import 'package:orange_theatre/config/components/internet_exception_widget.dart';
import 'package:orange_theatre/config/components/loading_widget.dart';
import 'package:orange_theatre/main.dart';
import 'package:orange_theatre/utils/enums.dart';
import '../Movie-Screen/movie_screen.dart';
import '../widgets/top_upcoming_item.dart';

class TopUpcomingMovies extends StatefulWidget {
  const TopUpcomingMovies({super.key});

  @override
  _TopUpcomingMoviesState createState() => _TopUpcomingMoviesState();
}

class _TopUpcomingMoviesState extends State<TopUpcomingMovies> {
  late PageController pageController;
  late UpcomingMoviesBloc upcomingMoviesBloc;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);
    upcomingMoviesBloc = UpcomingMoviesBloc(upcomingMoviesRepository: getIt());
  }

  @override
  void dispose() {
    pageController.dispose();
    upcomingMoviesBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.27,
        child: BlocProvider(
          create: (context) => upcomingMoviesBloc
            ..add(
              const FetchUpcomingMoviesEvent(),
            ),
          child: BlocBuilder<UpcomingMoviesBloc, UpcomingMoviesState>(
            builder: (context, state) {
              switch (state.upcomingMoviesList.status) {
                case Status.loading:
                  return const Center(child: LoadingWidget());

                case Status.error:
                  if (state.upcomingMoviesList.message ==
                      "No Internet Connection") {
                    return InterNetExceptionWidget(
                      onPress: () => upcomingMoviesBloc
                          .add(const FetchUpcomingMoviesEvent()),
                    );
                  }
                  return Center(
                    child: Text(state.upcomingMoviesList.message.toString()),
                  );

                case Status.completed:
                  final upcomingMoviesData = state.upcomingMoviesList.data;
                  if (upcomingMoviesData == null ||
                      upcomingMoviesData.results.isEmpty) {
                    return const Center(
                        child: Text('No upcoming movies available.'));
                  }
                  return CarouselSlider(
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height * .1,
                      enlargeCenterPage: true,
                      disableCenter: true,
                      viewportFraction: .75,
                      autoPlay: true,
                    ),
                    items: List.generate(
                        state.upcomingMoviesList.data!.results.length, (index) {
                      final movie =
                          state.upcomingMoviesList.data!.results[index];
                      return TopUpcomingItem(
                        data: movie,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MovieScreen(movieId: movie.id)));
                        },
                      );
                    }),
                  );

                default:
                  return const SizedBox.shrink();
              }
            },
          ),
        ));
  }
}
