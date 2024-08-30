import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/response/api_response.dart';
import '../../models/novie_model/movie_model.dart';
import '../../repository/repository.dart';
part 'movie_details_state.dart';
part 'movie_details_event.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieRepository movieDetailsRepository;
  MovieDetailsBloc({required this.movieDetailsRepository})
      : super(MovieDetailsState(movieDetails: ApiResponse.loading())) {
    on<FetchMovieDetailsEvent>(_fetchMovieDetailsApi);
  }

  Future<void> _fetchMovieDetailsApi(
      FetchMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    emit(state.copyWith(movieDetails: ApiResponse.loading()));

    try {
      final moviesDetails =
          await movieDetailsRepository.fetchMovieDetails(int.parse(event.movieId));
      emit(state.copyWith(movieDetails: ApiResponse.completed(moviesDetails)));
    } catch (error) {
      emit(state.copyWith(movieDetails: ApiResponse.error(error.toString())));
    }
  }
}
