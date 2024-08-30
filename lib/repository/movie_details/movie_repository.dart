
import 'package:orange_theatre/models/novie_model/movie_model.dart';

abstract class MovieRepository {
  Future<MovieModel> fetchMovieDetails(int movieId);
}