import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orange_theatre/bloc/movie_details_bloc/movie_details_bloc.dart';
import 'package:orange_theatre/config/app_url.dart';
import 'package:orange_theatre/config/components/internet_exception_widget.dart';
import 'package:orange_theatre/config/components/loading_widget.dart';
import 'package:orange_theatre/main.dart';
import 'package:orange_theatre/utils/enums.dart';
import 'package:orange_theatre/views/Movie-Screen/widgets/movies_logo_widget.dart';
import 'package:orange_theatre/views/Movie-Screen/widgets/movies_poster_widget.dart';
import 'package:orange_theatre/views/Movie-Screen/widgets/movies_rating_widget.dart';
import 'package:orange_theatre/views/Movie-Screen/widgets/movies_title_widget.dart';
import 'package:orange_theatre/views/Movie-Screen/widgets/release_revenue_popularity_widget.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

//533535 movie id
class _MovieScreenState extends State<MovieScreen> {
  late MovieDetailsBloc movieDetailsBloc;
  int movieId = 533535;
  @override
  void initState() {
    super.initState();
    movieDetailsBloc = MovieDetailsBloc(movieDetailsRepository: getIt());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) =>
          movieDetailsBloc..add(FetchMovieDetailsEvent(movieId)),
      child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          builder: (context, state) {
        switch (state.movieDetails.status) {
          case Status.loading:
            return const Center(child: LoadingWidget());

          case Status.error:
            if (state.movieDetails.message == "No Internet Connection") {
              return InterNetExceptionWidget(
                onPress: () =>
                    movieDetailsBloc..add(FetchMovieDetailsEvent(movieId)),
              );
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.movieDetails.message.toString()),
                ],
              ),
            );

          case Status.completed:
            final movieDetails = state.movieDetails.data;
            if (movieDetails == null) {
              return const Center(child: Text('No details available.'));
            }

            var productCompany = movieDetails.productionCompanies;

            // final room = movieDetails.;
            // if (kDebugMode) {
            //   print(widget.roomId);
            //   print('room::::::::');
            //   print(room);
            // }

            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      MoviesPosterWidget(
                          backdropPath: movieDetails.backdropPath),
                      MoviesLogoWidget(posterPath: movieDetails.posterPath),
                      MoviesRatingWidget(
                          voteAverage: movieDetails.voteAverage.toString()),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //Movies Title
                  MoviesTitleWidget(
                      movieTitle: movieDetails.originalTitle,
                      movieOverview: movieDetails.overview),
                  const SizedBox(
                    height: 10,
                  ),
                  //Relese, revenue, popularity
                  ReleaseRevenuePopularityWidget(
                    movieRelesedate: movieDetails.releaseDate,
                    movieRevenue: movieDetails.revenue.toString(),
                    moviePopularity: movieDetails.popularity.toString(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //production companies
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Production Companies",
                          style: GoogleFonts.poppins(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                            height: 100,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: productCompany.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(AppUrl
                                                  .imageBaseUrl +
                                              productCompany[index].logoPath),
                                          radius: 25,
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          productCompany[index].name,
                                          style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    ),
                                  );
                                })),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            );

          default:
            return const SizedBox();
        }
      }),
    ));
  }
}

// https://www.youtube.com/watch?v=pGhexqLeths

//https://th.bing.com/th/id/R.78ab058529b639453db95b7ed2a5011f?rik=q%2fJtTs0jpSGRpg&pid=ImgRaw&r=0

