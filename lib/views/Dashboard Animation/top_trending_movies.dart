import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_theatre/bloc/trending_movies_bloc/trending_movies_bloc.dart';
import 'package:orange_theatre/config/app_url.dart';
import 'package:orange_theatre/config/components/internet_exception_widget.dart';
import 'package:orange_theatre/config/components/loading_widget.dart';
import 'package:orange_theatre/main.dart';
import 'package:orange_theatre/utils/enums.dart';
import '../Movie-Screen/movie_screen.dart';
import 'widgets/card_content_widgets.dart'; // Assuming you have a CardContent widget defined

class TopTrendingMovies extends StatefulWidget {
  const TopTrendingMovies({super.key});

  @override
  _TopTrendingMoviesState createState() => _TopTrendingMoviesState();
}

class _TopTrendingMoviesState extends State<TopTrendingMovies> {
  late PageController pageController;
  late TrendingMoviesBloc trendingMoviesBloc;
  final int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);
    trendingMoviesBloc = TrendingMoviesBloc(trendingMoviesRepository: getIt());
    trendingMoviesBloc.add(const FetchTrendingMoviesEvent(page: 1));
  }

  @override
  void dispose() {
    pageController.dispose();
    trendingMoviesBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => trendingMoviesBloc),
        ],
        child: Column(
          children: [
            BlocBuilder<TrendingMoviesBloc, TrendingMoviesState>(
              builder: (context, state) {
                switch (state.trendingMoviesList.status) {
                  case Status.loading:
                    return const Center(child: LoadingWidget());

                  case Status.error:
                    if (state.trendingMoviesList.message ==
                        "No Internet Connection") {
                      return InterNetExceptionWidget(
                        onPress: () => trendingMoviesBloc
                            .add(FetchTrendingMoviesEvent(page: _currentPage)),
                      );
                    }
                    return Center(
                        child:
                            Text(state.trendingMoviesList.message.toString()));

                  case Status.completed:
                    if (kDebugMode) {
                      print('API called successfully');
                    }
                    final movieList = state.trendingMoviesList.data!;
                    if (kDebugMode) {
                      print({movieList.results.length});
                    }

                    return Expanded(
                      child: PageView.builder(
                        clipBehavior: Clip.none,
                        controller: pageController,
                        itemCount: movieList.results.length,
                        itemBuilder: (context, index) {
                          return AnimatedBuilder(
                            animation: pageController,
                            builder: (context, child) {
                              double pageOffset = 0;
                              if (pageController.position.haveDimensions) {
                                pageOffset = pageController.page! - index;
                              }
                              double gauss = math.exp(
                                  -(math.pow((pageOffset.abs() - 0.5), 2) /
                                      0.08));
                              return Transform.translate(
                                offset:
                                    Offset(-32 * gauss * pageOffset.sign, 0),
                                child: Container(
                                  clipBehavior: Clip.none,
                                  margin: const EdgeInsets.only(
                                    left: 8,
                                    right: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(32),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        offset: const Offset(8, 20),
                                        blurRadius: 24,
                                      ),
                                    ],
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => MovieScreen(
                                                  movieId: movieList
                                                      .results[index].id)));
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        ClipRRect(
                                          borderRadius:
                                              const BorderRadius.vertical(
                                                  top: Radius.circular(32)),
                                          child: Image.network(
                                            '${AppUrl.imageBaseUrl}${movieList.results[index].backdropPath}',
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.32, // 80% of 40% total height
                                            alignment:
                                                Alignment(-pageOffset.abs(), 0),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.07, // 20% of 40% total height
                                          child: CardContent(
                                            movieName: movieList
                                                .results[index].originalTitle,
                                            releaseDate: movieList
                                                .results[index].releaseDate,
                                            rating: movieList
                                                .results[index].voteAverage
                                                .toString(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    );

                  default:
                    return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
