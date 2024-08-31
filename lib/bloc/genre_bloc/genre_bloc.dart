import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_theatre/models/genre_model/genres_model.dart';
import 'package:orange_theatre/repository/genre/genre_repository.dart';
import '../../data/response/api_response.dart';
part 'genre_state.dart';
part 'genre_event.dart';

class GenreBloc extends Bloc<GenreEvent, GenreState> {
  GenreRepository genreRepository;
  GenreBloc({required this.genreRepository})
      : super(GenreState(genreList: ApiResponse.loading())) {
    on<FetchGenreEvent>(_fetchMovieDetailsApi);
  }

  Future<void> _fetchMovieDetailsApi(
      FetchGenreEvent event, Emitter<GenreState> emit) async {
    emit(state.copyWith(genreList: ApiResponse.loading()));

    try {
      final moviesDetails =
          await genreRepository.fetchGenre();
      emit(state.copyWith(genreList: ApiResponse.completed(moviesDetails)));
    } catch (error) {
      emit(state.copyWith(genreList: ApiResponse.error(error.toString())));
    }
  }
}
