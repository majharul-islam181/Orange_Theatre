import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orange_theatre/bloc/movie_details_bloc/movie_details_bloc.dart';
import 'package:orange_theatre/config/app_url.dart';
import 'package:orange_theatre/config/components/internet_exception_widget.dart';
import 'package:orange_theatre/config/components/loading_widget.dart';
import 'package:orange_theatre/main.dart';
import 'package:orange_theatre/utils/enums.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

//533535 movie id
class _MovieScreenState extends State<MovieScreen> {
  late MovieDetailsBloc movieDetailsBloc;
  List<String> imageUrls = [
    'url1',
    'url2',
    'url3',
    'url1',
    'url2',
    'url3',
    'url1',
    'url2',
    'url3',
    'url1',
    'url2',
    'url3',
    'url1',
    'url2',
    'url3',
  ]; // Replace with your image URLs
  List<String> names = [
    'Name1',
    'Name2',
    'Name3',
    'Name1',
    'Name2',
    'Name3',
    'Name1',
    'Name2',
    'Name3',
    'Name1',
    'Name2',
    'Name3',
    'Name1',
    'Name2',
    'Name3',
  ];

  int movieId = 533535;
  List<Map<String, dynamic>> genre = [
    {"id": 28, "name": "Action"},
    {"id": 35, "name": "Comedy"},
    {"id": 878, "name": "Science Fiction"}
  ];

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
                      Container(
                        color: Colors.transparent,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 100.0),
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(60),
                                  bottomRight: Radius.circular(60))),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.35,
                        decoration: const BoxDecoration(
                          // color: Colors.blue[900],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(770),
                            bottomRight: Radius.circular(40),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(400),
                            bottomRight: Radius.circular(5),
                          ),
                          child: Image.network(
                            'https://th.bing.com/th/id/R.78ab058529b639453db95b7ed2a5011f?rik=q%2fJtTs0jpSGRpg&pid=ImgRaw&r=0',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                          top: MediaQuery.of(context).size.height * .22,
                          left: 30,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Image.network(
                              'https://th.bing.com/th/id/R.b47abe620899296505b369ca1aea7539?rik=Vp2ncEwuYPT5%2fQ&riu=http%3a%2f%2fimages2.fanpop.com%2fimage%2fphotos%2f13000000%2fSpider-Man-spider-man-13062150-1280-1572.jpg&ehk=193u8f4xtMXTNRqmwccMThPn1irEykUWdkBqLse9oJU%3d&risl=&pid=ImgRaw&r=0',
                              height: 100,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                          )),
                      Positioned(
                          top: MediaQuery.of(context).size.height * .3,
                          right: 16,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/review.svg',
                                  height: 20,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '222',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          )),
                    ],
                  ),

                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movieDetails.originalTitle,
                          style: GoogleFonts.poppins(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(movieDetails.overview,
                            style: GoogleFonts.poppins(
                                fontSize: 10, fontWeight: FontWeight.w300)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Icon(
                                Icons.new_releases,
                                color: Colors.red,
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Text(
                                movieDetails.releaseDate,
                                style: GoogleFonts.poppins(
                                    fontSize: 13, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/ecommerce-money-svgrepo-com.svg',
                                height: 20,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                movieDetails.revenue.toString(),
                                style: GoogleFonts.poppins(
                                    fontSize: 13, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/fire.svg',
                              height: 25,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              movieDetails.popularity.toString(),
                              style: GoogleFonts.poppins(
                                  fontSize: 13, fontWeight: FontWeight.w400),
                            )
                          ],
                        )),
                      ],
                    ),
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

