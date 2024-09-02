// ignore_for_file: avoid_unnecessary_containers, unused_local_variable
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:orange_theatre/bloc/genre_bloc/genre_bloc.dart';
import 'package:orange_theatre/bloc/trending_movies_bloc/trending_movies_bloc.dart';
import 'package:orange_theatre/config/app_url.dart';
import 'package:orange_theatre/models/genre_model/genres_model.dart';
import 'package:orange_theatre/models/movie_model/movie_model.dart';
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
  late ScrollController _scrollController;
  int _currentPage = 1;
  bool _isFetchingMore = false;
  String searchQuery = "";
  String? selectedLocation;
  double? minPrice;
  double? maxPrice;
  bool isAvailable = false;
  int? movieLength;

  // New variables
  String? selectedGenre; // Variable for selected genre
  final List<Genre> genres = []; // List of genres to populate from API or local data

  final List<String> locations = ["Bangladesh"];

  @override
  void initState() {
    super.initState();
    trendingMoviesBloc = TrendingMoviesBloc(trendingMoviesRepository: getIt());
    trendingMoviesBloc.add(const FetchTrendingMoviesEvent(page: 1));
    minPrice = 0;
    maxPrice = 1000;

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (!_isFetchingMore) {
          setState(() {
            _isFetchingMore = true;
          });
          _currentPage++;
          trendingMoviesBloc.add(FetchTrendingMoviesEvent(page: _currentPage));
        }
      }
    });
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
                  _currentPage = 1;
                  trendingMoviesBloc
                      .add(const FetchTrendingMoviesEvent(page: 1));
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
                            onPress: () =>    trendingMoviesBloc
                      .add( FetchTrendingMoviesEvent(page: _currentPage)),
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
                          itemCount: filteredMovie.length +( _isFetchingMore ? 1 : 0),
                          itemBuilder: (context, index) {
                            final movie = filteredMovie[index];

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

            // Genre Filter
            DropdownButtonFormField<String>(
              value: selectedGenre,
              hint: const Text("Select Genre"),
              items: genres.map((genre) {
                return DropdownMenuItem<String>(
                  value: genre.id.toString(),
                  child: Text(genre.name),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedGenre = value;
                });
              },
            ),
            const SizedBox(height: 16),
     

            // Video Filter
            // SwitchListTile(
            //   title: const Text("Only Videos"),
            //   value: onlyVideos,
            //   onChanged: (value) {
            //     setState(() {
            //       onlyVideos = value;
            //     });
            //   },
            // ),
            // const SizedBox(height: 16),

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

// }

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
// import 'package:orange_theatre/bloc/genre_bloc/genre_bloc.dart';
// import 'package:orange_theatre/bloc/trending_movies_bloc/trending_movies_bloc.dart';
// import 'package:orange_theatre/config/app_url.dart';
// import 'package:orange_theatre/config/colors/color.dart';
// import 'package:orange_theatre/main.dart';
// import 'package:orange_theatre/models/genre_model/genres_model.dart';
// import 'package:orange_theatre/utils/constant.dart';
// import 'package:orange_theatre/utils/enums.dart';
// import 'package:orange_theatre/views/Movie-Screen/movie_screen.dart';
// import '../widgets.dart';

// class ExploreRoot extends StatefulWidget {
//   const ExploreRoot({super.key});

//   @override
//   State<ExploreRoot> createState() => _ExploreRootState();
// }

// class _ExploreRootState extends State<ExploreRoot> {
//   late TrendingMoviesBloc trendingMoviesBloc;
//   late ScrollController _scrollController;
//   int _currentPage = 1;
//   bool _isFetchingMore = false;
//   String searchQuery = "";
//   String? selectedLocation;
//   String? selectedGenre;
//   double? minRating;
//   double? maxRating;
//   String? selectedLanguage;
//   bool onlyVideos = false;

//   final List<String> locations = ["Bangladesh"];
// List<String> languages = [];

//   @override
//   void initState() {
//     super.initState();
//     trendingMoviesBloc = TrendingMoviesBloc(trendingMoviesRepository: getIt());
//     trendingMoviesBloc.add(const FetchTrendingMoviesEvent(page: 1));
//     minRating = 0;
//     maxRating = 10;

//     _scrollController = ScrollController();
//     _scrollController.addListener(() {
//       if (_scrollController.position.pixels ==
//           _scrollController.position.maxScrollExtent) {
//         if (!_isFetchingMore) {
//           setState(() {
//             _isFetchingMore = true;
//           });
//           _currentPage++;
//           trendingMoviesBloc.add(FetchTrendingMoviesEvent(page: _currentPage));
//         }
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//     trendingMoviesBloc.close();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: getAppBar(),
//       ),
//       body: MultiBlocProvider(
//         providers: [
//           BlocProvider(create: (context) => trendingMoviesBloc),
//           BlocProvider(
//               create: (context) => GenreBloc(genreRepository: getIt())
//                 ..add(const FetchGenreEvent())),
//         ],
//         child: Column(
//           children: [
//             getSearchBox(),
//             const SizedBox(height: 4),
//             Expanded(
//               child: LiquidPullToRefresh(
//                 showChildOpacityTransition: false,
//                 onRefresh: () async {
//                   _currentPage = 1;
//                   trendingMoviesBloc
//                       .add(const FetchTrendingMoviesEvent(page: 1));
//                 },
//                 child: BlocBuilder<TrendingMoviesBloc, TrendingMoviesState>(
//                   builder: (context, state) {
//                     switch (state.trendingMoviesList.status) {
//                       case Status.loading:
//                         return const Center(child: LoadingWidget());

//                       case Status.error:
//                         if (state.trendingMoviesList.message ==
//                             "No Internet Connection") {
//                           return InterNetExceptionWidget(
//                             onPress: () => trendingMoviesBloc.add(
//                                 FetchTrendingMoviesEvent(page: _currentPage)),
//                           );
//                         }
//                         return Center(
//                             child: Text(
//                                 state.trendingMoviesList.message.toString()));

//                       case Status.completed:
//                         if (kDebugMode) {
//                           print('API called successfully');
//                         }
//                         final movieList = state.trendingMoviesList.data!;
//                         final filteredMovie = movieList.results.where((movie) {
//                           return movie.title
//                               .toLowerCase()
//                               .contains(searchQuery.toLowerCase());
//                         }).toList();

//                         return ListView.builder(
//                           controller: _scrollController,
//                           itemCount:
//                               filteredMovie.length + (_isFetchingMore ? 1 : 0),
//                           itemBuilder: (context, index) {
//                             if (index >= filteredMovie.length) {
//                               // Show a loading indicator at the end
//                               return const Center(
//                                   child: CircularProgressIndicator());
//                             }

//                             final movie = filteredMovie[index];
//                             final imageUrl = movie.posterPath.isNotEmpty
//                                 ? "${AppUrl.imageBaseUrl}${movie.posterPath}"
//                                 : '';

//                             return GestureDetector(
//                               onTap: () {
//                                 if (kDebugMode) {
//                                   print("Movie ID: ${movie.id}");
//                                 }
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) =>
//                                         MovieScreen(movieId: movie.id),
//                                   ),
//                                 );
//                               },
//                               child: ExploreWidget(
//                                 imageUrl: imageUrl,
//                                 movieTitle: movie.title,
//                                 releaseDate: movie.releaseDate,
//                                 genreName: movie.genreIds.map((id) {
//                                   final genre = genresList.firstWhere(
//                                     (g) => g.id == id,
//                                     orElse: () =>
//                                         GenresModel(id: id, name: 'Unknown'),
//                                   );
//                                   return genre.name;
//                                 }).join(', '),
//                               ),
//                             );
//                           },
//                         );

//                       default:
//                         return const SizedBox();
//                     }
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _showFilterBottomSheet,
//         child: const Icon(Icons.filter_list),
//       ),
//     );
//   }

//   Widget getAppBar() {
//     return Container(
//       child: const Row(
//         children: [
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Text(
//               'Explore Movies',
//               style: TextStyle(
//                 color: AppColor.textColor,
//                 fontWeight: FontWeight.w600,
//                 fontSize: 20,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget getSearchBox() {
//     return Padding(
//       padding: const EdgeInsets.only(left: 15, right: 15),
//       child: Row(
//         children: [
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.only(bottom: 3.0),
//               child: Container(
//                 height: 40,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                   boxShadow: [
//                     BoxShadow(
//                       color: AppColor.shadowColor.withOpacity(.05),
//                       spreadRadius: .5,
//                       blurRadius: .5,
//                       offset: const Offset(0, 0),
//                     ),
//                   ],
//                 ),
//                 child: TextField(
//                   onChanged: (value) {
//                     setState(() {
//                       searchQuery = value; // Update the search query
//                     });
//                   },
//                   decoration: const InputDecoration(
//                     prefixIcon: Icon(
//                       Icons.search,
//                       color: Colors.grey,
//                     ),
//                     border: InputBorder.none,
//                     hintText: "Search by name or location",
//                     hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(width: 10),
//           GestureDetector(
//             onTap: _showFilterBottomSheet,
//             child: Container(
//               padding: const EdgeInsets.all(5),
//               decoration: BoxDecoration(
//                 color: AppColor.primary,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: SvgPicture.asset(
//                 'assets/icons/filter.svg',
//                 color: Colors.white,
//                 width: 20,
//                 height: 20,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Function to show the filter bottom sheet
//  void _showFilterBottomSheet() {
//     showModalBottomSheet(
//       context: context,
//       builder: (context) {
//         return Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Text(
//                 "Filter Options",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 16),
//               // Genre Filter
//               DropdownButtonFormField<String>(
//                 value: selectedGenre,
//                 hint: const Text("Select Genre"),
//                 items: genresList.map((genre) {
//                   return DropdownMenuItem<String>(
//                     value: genre.id.toString(),
//                     child: Text(genre.name),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     selectedGenre = value;
//                   });
//                 },
//               ),
//               const SizedBox(height: 16),
//               // Language Filter
//               DropdownButtonFormField<String>(
//                 value: selectedLanguage,
//                 hint: const Text("Select Language"),
//                 items: languages.map((language) {
//                   return DropdownMenuItem<String>(
//                     value: language,
//                     child: Text(language),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     selectedLanguage = value;
//                   });
//                 },
//               ),
//               const SizedBox(height: 16),
//               // Rating Filter
//               RangeSlider(
//                 values: RangeValues(minRating ?? 0, maxRating ?? 10),
//                 min: 0,
//                 max: 10,
//                 divisions: 10,
//                 labels: RangeLabels(
//                   minRating.toString(),
//                   maxRating.toString(),
//                 ),
//                 onChanged: (values) {
//                   setState(() {
//                     minRating = values.start;
//                     maxRating = values.end;
//                   });
//                 },
//               ),
//               const SizedBox(height: 16),
             
//               const SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pop(context); // Close the bottom sheet
//                 },
//                 child: const Text("Apply Filters"),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
 }
