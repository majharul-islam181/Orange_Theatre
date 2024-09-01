import 'package:flutter/material.dart';
import 'package:orange_theatre/views/Movie-Screen/movie_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<String> _favoriteMovies = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _favoriteMovies = prefs.getStringList('favorites') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favorites')),
      body: _favoriteMovies.isEmpty
          ? Center(child: Text('No favorites added yet.'))
          : ListView.builder(
              itemCount: _favoriteMovies.length,
              itemBuilder: (context, index) {
                // Here you would fetch the movie details based on the ID.
                return ListTile(
                  title: Text('Movie ID: ${_favoriteMovies[index]}'), // Display movie ID or title
                  onTap: () {
                    // Navigate to MovieScreen with the selected movie ID
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieScreen(movieId: int.parse(_favoriteMovies[index])),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}


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

