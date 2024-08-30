import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orange_theatre/bloc/movie_details_bloc/movie_details_bloc.dart';
import 'package:orange_theatre/config/app_url.dart';
import 'package:orange_theatre/main.dart';
import 'package:orange_theatre/utils/enums.dart';
import 'package:orange_theatre/views/Movie-Screen/widgets/video_bool_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets.dart';

class MovieScreen extends StatefulWidget {
  final int movieId;
   MovieScreen({super.key, required this.movieId});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

//533535 movie id
class _MovieScreenState extends State<MovieScreen> {
  late MovieDetailsBloc movieDetailsBloc;

  @override
  void initState() {
    super.initState();
    movieDetailsBloc = MovieDetailsBloc(movieDetailsRepository: getIt());
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) =>
          movieDetailsBloc..add(FetchMovieDetailsEvent(widget.movieId)),
      child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          builder: (context, state) {
        switch (state.movieDetails.status) {
          case Status.loading:
            return const Center(child: LoadingWidget());

          case Status.error:
            if (state.movieDetails.message == "No Internet Connection") {
              return InterNetExceptionWidget(
                onPress: () =>
                    movieDetailsBloc..add(FetchMovieDetailsEvent(widget.movieId)),
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
                      Positioned(
                          top: MediaQuery.of(context).size.height * .07,
                          right: 30,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2)),
                                child: const Center(
                                    child: Icon(
                                  Icons.favorite_rounded,
                                  color: Colors.white,
                                ))),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //Movies Title
                  MoviesTitleWidget(
                    movieTitle: movieDetails.originalTitle,
                    movieOverview: movieDetails.overview,
                    onPressed: () => _launchURL(movieDetails.homepage),
                  ),
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

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'A Short Summary of ${movieDetails.originalTitle}',
                          style: GoogleFonts.poppins(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        const Divider(),
                        Row(
                          children: [
                            Text(
                              'Origin Country :  ${movieDetails.originCountry}',
                              style: GoogleFonts.poppins(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Text(
                          'Production Countries: ${movieDetails.productionCountries.map((country) => country.name).join(', ')}',
                        ),
                        Text(
                          'Budget : ${movieDetails.budget}',
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'Original Language : ${movieDetails.originalLanguage}',
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'Spoken Language : ${movieDetails.spokenLanguages.map((lang) => lang.name).join(', ')}',
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                        movieDetails.video == false
                            ? VideoBoolWidget(
                                icon: Icons.cancel_sharp,
                                color: Colors.red[100],
                              )
                            : VideoBoolWidget(
                                color: Colors.green[300],
                                icon: Icons.check_box_rounded,
                              ),
                      ],
                    ),
                  ),
                  //production companies
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Production Companies: ",
                          style: GoogleFonts.poppins(
                              fontSize: 18, fontWeight: FontWeight.w500),
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
                              final company = productCompany[index];
                              final logoUrl = company.logoPath.isNotEmpty
                                  ? AppUrl.imageBaseUrl + company.logoPath
                                  : null;

                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: logoUrl != null
                                          ? NetworkImage(logoUrl)
                                          : const AssetImage(
                                              'assets/images/enterprise.png',
                                            ),
                                      radius: 20,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      company.name,
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
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
