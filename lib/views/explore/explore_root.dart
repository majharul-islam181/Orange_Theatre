// ignore_for_file: avoid_unnecessary_containers, unused_local_variable
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:orange_theatre/config/app_url.dart';
import 'package:orange_theatre/models/genre_model/genres_model.dart';
import 'package:orange_theatre/utils/constant.dart';
import 'package:orange_theatre/utils/enums.dart';
import 'package:orange_theatre/views/Movie-Screen/movie_screen.dart';
import '../../bloc/bloc.dart';
import '../../config/colors/color.dart';
import '../../main.dart';
import '../../models/trending_movies/trending_movies_model.dart';
import '../widgets.dart';

class ExploreRoot extends StatefulWidget {
  const ExploreRoot({super.key});

  @override
  State<ExploreRoot> createState() => _ExploreRootState();
}

class _ExploreRootState extends State<ExploreRoot> {
  late TrendingMoviesBloc trendingMoviesBloc;
  late ScrollController _scrollController;
  int _currentPage = 1;
  bool _isFetchingMore = false;
  String searchQuery = "";
  // String searchQueryForFilter = "";
  String? _selectedValue;
  List<int> movieId = [];

  @override
  void initState() {
    super.initState();
    trendingMoviesBloc = TrendingMoviesBloc(trendingMoviesRepository: getIt());
    trendingMoviesBloc.add(FetchTrendingMoviesEvent(
        page: _currentPage)); // Fetch initial data for page 1
    _scrollController = ScrollController();
    _scrollController
        .addListener(_handleScroll); // Attach listener for scrolling
  }

  void _handleScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (!_isFetchingMore) {
        setState(() {
          _isFetchingMore = true;
        });
        _currentPage++;
        trendingMoviesBloc.add(FetchTrendingMoviesEvent(
            page: _currentPage)); // Fetch data for next page
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
    trendingMoviesBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: getAppBar(),
      ),
      // backgroundColor: Colors.black.withOpacity(.02),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => trendingMoviesBloc),
          BlocProvider(
            create: (context) => GenreBloc(genreRepository: getIt())
              ..add(const FetchGenreEvent()),
          ),
        ],
        child: Column(
          children: [
            const SizedBox(
              height: 05,
            ),
            BlocBuilder<TrendingMoviesBloc, TrendingMoviesState>(
              builder: (context, state) {
                if (state.trendingMoviesList.status == Status.completed) {
                  final movieList = state.trendingMoviesList.data!;
                  return getSearchBox(movieList);
                }
                return getSearchBox(TrendingMoviesModel(results: []));
              },
            ),
            const SizedBox(height: 4),
            Expanded(
              child: LiquidPullToRefresh(
                showChildOpacityTransition: false,
                onRefresh: () async {
                  _currentPage = 1; // Reset page for refresh
                  trendingMoviesBloc.add(const FetchTrendingMoviesEvent(
                      page: 1)); // Fetch data for page 1 again
                },
                child: BlocBuilder<TrendingMoviesBloc, TrendingMoviesState>(
                  builder: (context, state) {
                    switch (state.trendingMoviesList.status) {
                      case Status.loading:
                        if (_currentPage == 1) {
                          return const Center(child: LoadingWidget());
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                      case Status.error:
                        if (state.trendingMoviesList.message ==
                            "No Internet Connection") {
                          return InterNetExceptionWidget(
                            onPress: () => trendingMoviesBloc.add(
                              FetchTrendingMoviesEvent(page: _currentPage),
                            ),
                          );
                        }
                        return Center(
                          child: Text(
                            state.trendingMoviesList.message.toString(),
                          ),
                        );

                      case Status.completed:
                        final movieList = state.trendingMoviesList.data!;

                        final filteredMovies = movieList.results
                            .where((movie) =>
                                (movieId.isEmpty ||
                                    movieId.contains(movie.id)) ||
                                (searchQuery.isEmpty ||
                                    movie.title
                                        .toLowerCase()
                                        .contains(searchQuery.toLowerCase())))
                            .toList();

                        _isFetchingMore = false;

                        if (filteredMovies.isEmpty && _currentPage == 1) {
                          return const Center(child: Text("No movies found."));
                        }

                        return ListView.builder(
                          controller: _scrollController,
                          itemCount:
                              filteredMovies.length + (_isFetchingMore ? 1 : 0),
                          itemBuilder: (context, index) {
                            if (index == filteredMovies.length) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }

                            final movie = filteredMovies[index];

                            final imageUrl = movie.posterPath.isNotEmpty
                                ? "${AppUrl.imageBaseUrl}${movie.posterPath}"
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Explore Movies',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getSearchBox(TrendingMoviesModel movieList) {
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
                    hintText: "Search by movie title",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              _showFilterBottomSheet(movieList);
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

  void _showFilterBottomSheet(TrendingMoviesModel movieList) {
    List<bool> selectedGenres = List.generate(genresList.length, (_) => false);

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * .9,
            width: MediaQuery.of(context).size.width * .98,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Filter Options",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: genresList.length,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        title: Text(genresList[index].name),
                        value: selectedGenres[index],
                        onChanged: (bool? value) {
                          setState(() {
                            selectedGenres[index] = value ?? false;
                          });
                        },
                        checkColor:
                            Colors.white, 
                        activeColor:
                            Colors.blue, 
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Get the list of selected genre IDs
                    List<int> selectedGenreIds = genresList
                        .asMap()
                        .entries
                        .where((entry) => selectedGenres[entry.key])
                        .map((entry) => entry.value.id)
                        .toList();

                    List<Movie> filteredMovies = movieList.results
                        .where((movie) =>
                            selectedGenreIds.isEmpty ||
                            movie.genreIds
                                .any((id) => selectedGenreIds.contains(id)))
                        .toList();

                    setState(() {
                      movieId =
                          filteredMovies.map((movie) => movie.id).toList();
                      searchQuery = selectedGenreIds.isEmpty
                          ? ""
                          : 'Filtered by ${selectedGenreIds.length} genres';
                    });
                    Navigator.pop(context);
                  },
                  child: const Text("Apply Filters"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
