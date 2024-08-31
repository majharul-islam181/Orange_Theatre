// ignore_for_file: avoid_unnecessary_containers, unused_local_variable
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:orange_theatre/bloc/genre_bloc/genre_bloc.dart';
import 'package:orange_theatre/bloc/trending_movies_bloc/trending_movies_bloc.dart';
import 'package:orange_theatre/models/genre_model/genres_model.dart';
import 'package:orange_theatre/utils/constant.dart';
import 'package:orange_theatre/utils/enums.dart';
import 'package:orange_theatre/views/Movie-Screen/movie_screen.dart';
import '../../config/colors/color.dart';
import '../../main.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets.dart';

class ExploreRoot extends StatefulWidget {
  const ExploreRoot({super.key});

  @override
  State<ExploreRoot> createState() => _ExploreRootState();
}

class _ExploreRootState extends State<ExploreRoot> {
  late TrendingMoviesBloc trendingMoviesBloc;
  String searchQuery = "";
  String? selectedLocation;
  double? minPrice;
  double? maxPrice;
  bool isAvailable = false;
  int? movieLength;

  final List<String> locations = ["Bangladesh"];

  @override
  void initState() {
    super.initState();
    trendingMoviesBloc = TrendingMoviesBloc(trendingMoviesRepository: getIt());
    trendingMoviesBloc.add(const FetchTrendingMoviesEvent());
    minPrice = 0;
    maxPrice = 1000;
  }

  @override
  void dispose() {
    super.dispose();
    trendingMoviesBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: getAppBar(),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => trendingMoviesBloc),
          BlocProvider(
              create: (context) => GenreBloc(genreRepository: getIt())
                ..add(const FetchGenreEvent())),
        ],
        child: Column(
          children: [
            getSearchBox(),
            const SizedBox(height: 4),
            Expanded(
              child: LiquidPullToRefresh(
                showChildOpacityTransition: false,
                onRefresh: () async {
                  trendingMoviesBloc.add(const FetchTrendingMoviesEvent());
                },
                child: BlocBuilder<TrendingMoviesBloc, TrendingMoviesState>(
                  builder: (context, state) {
                    switch (state.trendingMoviesList.status) {
                      case Status.loading:
                        return const Center(child: LoadingWidget());

                      case Status.error:
                        if (state.trendingMoviesList.message ==
                            "No Internet Connection") {
                          return InterNetExceptionWidget(
                            onPress: () => trendingMoviesBloc
                                .add(const FetchTrendingMoviesEvent()),
                          );
                        }
                        return Center(
                            child: Text(
                                state.trendingMoviesList.message.toString()));

                      case Status.completed:
                        if (kDebugMode) {
                          print('API called successfully');
                        }
                        final movieList = state.trendingMoviesList.data!;
                        final filteredMovie = movieList.results.where((movie) {
                          return movie.title
                              .toLowerCase()
                              .contains(searchQuery.toLowerCase());
                        }).toList();

                        return ListView.builder(
                          itemCount: filteredMovie.length,
                          itemBuilder: (context, index) {
                            final movie = filteredMovie[index];

                            final imageUrl = movie.posterPath.isNotEmpty
                                ? "https://image.tmdb.org/t/p/w500${movie.posterPath}"
                                : '';

                            return GestureDetector(
                              onTap: () {
                                if (kDebugMode) {
                                  print("Movie ID: ${movie.id}");
                                }
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        MovieScreen(movieId: movie.id),
                                  ),
                                );
                              },
                              child: ExploreWidget(
                                imageUrl: imageUrl,
                                movieTitle: movie.title,
                                releaseDate: movie.releaseDate,
                                genreName: movie.genreIds.map((id) {
                                  final genre = genresList.firstWhere(
                                    (g) => g.id == id,
                                    orElse: () =>
                                        GenresModel(id: id, name: 'Unknown'),
                                  );
                                  return genre.name;
                                }).join(', '),
                              ),
                            );
                          },
                        );

                      default:
                        return const SizedBox();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getAppBar() {
    return Container(
      child: const Row(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Explore Movies',
              style: TextStyle(
                color: AppColor.textColor,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getSearchBox() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 3.0),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.shadowColor.withOpacity(.05),
                      spreadRadius: .5,
                      blurRadius: .5,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value; // Update the search query
                    });
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    border: InputBorder.none,
                    hintText: "Search by name or location",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              _showFilterBottomSheet();
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(
                'assets/icons/filter.svg',
                color: Colors.white,
                width: 20,
                height: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Function to show the filter bottom sheet
  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Filter Options",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedLocation,
                hint: const Text("Select Location"),
                items: locations.map((location) {
                  return DropdownMenuItem<String>(
                    value: location,
                    child: Text(location),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedLocation = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              const Text("Price Range"),
              RangeSlider(
                values: RangeValues(minPrice ?? 0, maxPrice ?? 1000),
                min: 0,
                max: 1000,
                divisions: 10,
                labels: RangeLabels(
                  minPrice.toString(),
                  maxPrice.toString(),
                ),
                onChanged: (values) {
                  setState(() {
                    minPrice = values.start;
                    maxPrice = values.end;
                  });
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: isAvailable,
                    onChanged: (value) {
                      setState(() {
                        isAvailable = value!;
                      });
                    },
                  ),
                  const Text("Available only"),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the bottom sheet
                },
                child: const Text("Apply Filters"),
              ),
            ],
          ),
        );
      },
    );
  }
}
