// import 'package:flutter/material.dart';
// import 'package:orange_theatre/views/Movie-Screen/movie_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';


// class FavoriteScreen extends StatefulWidget {
//   @override
//   _FavoriteScreenState createState() => _FavoriteScreenState();
// }

// class _FavoriteScreenState extends State<FavoriteScreen> {
//   late Future<List<String>> _favoritesFuture;

//   @override
//   void initState() {
//     super.initState();
//     _favoritesFuture = _loadFavorites();
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     _refreshFavoritesIfFocused();
//   }

//   void _refreshFavoritesIfFocused() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (ModalRoute.of(context)!.isCurrent) {
//         _loadFavorites();
//       }
//     });
//   }

//   Future<List<String>> _loadFavorites() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getStringList('favorites') ?? [];
//   }

//   Future<void> _reloadFavorites() async {
//     setState(() {
//       _favoritesFuture = _loadFavorites();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Favorites')),
//       body: FutureBuilder<List<String>>(
//         future: _favoritesFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Failed to load favorites.'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('No favorites added yet.'));
//           } else {
//             List<String> favoriteMovies = snapshot.data!;
//             return ListView.builder(
//               itemCount: favoriteMovies.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text('Movie ID: ${favoriteMovies[index]}'),
//                   onTap: () async {
//                     // Navigate to MovieScreen
//                     await Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => MovieScreen(
//                           movieId: int.parse(favoriteMovies[index]),
//                         ),
//                       ),
//                     );
//                     _reloadFavorites();  // Reload favorites after coming back
//                   },
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }




// class FavoriteScreen extends StatefulWidget {
//   @override
//   _FavoriteScreenState createState() => _FavoriteScreenState();
// }

// class _FavoriteScreenState extends State<FavoriteScreen> {
//   Future<List<String>> _loadFavorites() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getStringList('favorites') ?? [];
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _loadFavorites();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Favorites')),
//       body: FutureBuilder<List<String>>(
//         future: _loadFavorites(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             // Show loading indicator while waiting for the future to complete
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             // Handle error state
//             return Center(child: Text('Failed to load favorites.'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             // Handle empty favorites list
//             return Center(child: Text('No favorites added yet.'));
//           } else {
//             // Display the list of favorite movies
//             List<String> favoriteMovies = snapshot.data!;
//             return ListView.builder(
//               itemCount: favoriteMovies.length,
//               itemBuilder: (context, index) {
//                 // Here you would fetch the movie details based on the ID.
//                 return ListTile(
//                   title: Text(
//                       'Movie ID: ${favoriteMovies[index]}'), // Display movie ID or title
//                   onTap: () {
//                     // Navigate to MovieScreen with the selected movie ID
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => MovieScreen(
//                             movieId: int.parse(favoriteMovies[index])),
//                       ),
//                     );
//                   },
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }







// class FavoriteScreen extends StatefulWidget {
//   @override
//   _FavoriteScreenState createState() => _FavoriteScreenState();
// }

// class _FavoriteScreenState extends State<FavoriteScreen> {
//   List<String> _favoriteMovies = [];

//   @override
//   void initState() {
//     super.initState();
//     _loadFavorites();
//   }

//   Future<void> _loadFavorites() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _favoriteMovies = prefs.getStringList('favorites') ?? [];
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Favorites')),
//       body: _favoriteMovies.isEmpty
//           ? Center(child: Text('No favorites added yet.'))
//           : ListView.builder(
//               itemCount: _favoriteMovies.length,
//               itemBuilder: (context, index) {
//                 // Here you would fetch the movie details based on the ID.
//                 return ListTile(
//                   title: Text('Movie ID: ${_favoriteMovies[index]}'), // Display movie ID or title
//                   onTap: () {
//                     // Navigate to MovieScreen with the selected movie ID
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => MovieScreen(movieId: int.parse(_favoriteMovies[index])),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:orange_theatre/models/movie_model/movie_model.dart';
// import 'package:orange_theatre/views/Movie-Screen/movie_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class FavoriteScreen extends StatefulWidget {
//   @override
//   _FavoriteScreenState createState() => _FavoriteScreenState();
// }

// class _FavoriteScreenState extends State<FavoriteScreen> {
//   List<String> _favoriteMovies = [];

//   @override
//   void initState() {
//     super.initState();
//     _loadFavorites();
//   }

//   Future<void> _loadFavorites() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _favoriteMovies = prefs.getStringList('favorites') ?? [];
//     });
//   }

//   Future<MovieModel?> _getMovieDetails(int movieId) async {
//     // Implement your logic to fetch movie details by ID
//     // This could be an API call or fetching from a local database
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Favorites')),
//       body: _favoriteMovies.isEmpty
//           ? Center(child: Text('No favorites added yet.'))
//           : FutureBuilder<List<MovieModel?>>(
//               future: Future.wait(_favoriteMovies.map((id) => _getMovieDetails(int.parse(id)))),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator()); // Loading indicator
//                 } else if (snapshot.hasError) {
//                   return Center(child: Text('Error loading favorites'));
//                 } else {
//                   List<MovieModel?> movies = snapshot.data?.where((movie) => movie != null).cast<MovieModel>().toList() ?? [];
//                   return ListView.builder(
//                     itemCount: movies.length,
//                     itemBuilder: (context, index) {
//                       final movie = movies[index];
//                       return ListTile(
//                         title: Text(movie?.originalTitle ?? 'Unknown Title'), // Display movie title
//                         onTap: () {
//                           // Navigate to MovieScreen with the selected movie ID
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => MovieScreen(movieId: movie?.id ?? 0),
//                             ),
//                           );
//                         },
//                       );
//                     },
//                   );
//                 }
//               },
//             ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:orange_theatre/models/favourite/favourite_model_hive.dart';
import 'package:orange_theatre/models/models.dart';
import 'package:orange_theatre/views/Movie-Screen/movie_screen.dart';
import 'package:orange_theatre/views/Movie-Screen/widgets/movies_poster_widget.dart';
class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  Box<FavouriteModelHive>? favoriteMoviesBox;

  @override
  void initState() {
    super.initState();
    _openBox();
  }

  Future<void> _openBox() async {
    favoriteMoviesBox = await Hive.openBox<FavouriteModelHive>('favouritesBox');
    setState(() {}); // Refresh the UI after opening the box
  }

  @override
  void dispose() {
    favoriteMoviesBox?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Movies"),
      ),
      body: favoriteMoviesBox == null
          ? const Center(child: CircularProgressIndicator()) // Show a loading indicator while the box is opening
          : favoriteMoviesBox!.isEmpty
              ? const Center(
                  child: Text("No favorite movies yet."),
                )
              : ListView.builder(
                  itemCount: favoriteMoviesBox!.length,
                  itemBuilder: (context, index) {
                    final movie = favoriteMoviesBox!.getAt(index);

                    return ListTile(
                      leading: MoviesPosterWidget(backdropPath: movie!.backdropPath),
                      title: Text(movie.originalTitle),
                      subtitle: Text(movie.releaseDate),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            favoriteMoviesBox!.deleteAt(index);
                          });
                        },
                      ),
                      onTap: () {
                        // Navigate to Movie Details Screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MovieScreen(movieId: movie.id),
                          ),
                        );
                      },
                    );
                  },
                ),
    );
  }
}
