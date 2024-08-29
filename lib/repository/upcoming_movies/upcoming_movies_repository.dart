

import 'package:orange_theatre/models/upcoming_movies/upcoming_movies_model.dart';

abstract class UpcomingMoviesRepository {
  Future<UpcomingMoviesModel> fetchUpcomingMoviesList();
}