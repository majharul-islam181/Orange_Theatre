

import 'package:orange_theatre/models/trending_movies/trending_movies_model.dart';

abstract class TrendingMoviesRepository {
  Future<TrendingMoviesModel> fetchTrendingMoviesList();
}