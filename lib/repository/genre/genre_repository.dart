import 'package:orange_theatre/models/genre_model/genres_model.dart';

abstract class GenreRepository {
  Future<GenresModel> fetchGenre();
}