import 'dart:convert';
import 'package:orange_theatre/models/trending_movies/trending_movies_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteMoviesService {
  static const String favoritesKey = 'favorites';

  Future<List<Movie>> loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? favoritesJson = prefs.getString(favoritesKey);
    if (favoritesJson != null) {
      List<dynamic> jsonList = json.decode(favoritesJson);
      return jsonList.map((json) => Movie.fromJson(json)).toList();
    }
    return [];
  }

  Future<void> saveFavorites(List<Movie> favorites) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String favoritesJson = json.encode(favorites.map((movie) => movie.toJson()).toList());
    await prefs.setString(favoritesKey, favoritesJson);
  }
}
