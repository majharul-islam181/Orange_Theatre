
import 'package:orange_theatre/models/movie_model/movie_model.dart';

abstract class MovieRepository {
  Future<MovieModel> fetchMovieDetails(int movieId);
}