import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:orange_theatre/data/response/api_response.dart';
import 'package:orange_theatre/models/trending_movies/trending_movies_model.dart';
import 'package:orange_theatre/repository/trending_movies/trending_movies_repository.dart';
part 'trending_movies_event.dart';
part 'trending_movies_state.dart';

class TrendingMoviesBloc
    extends Bloc<TrendingMoviesEvent, TrendingMoviesState> {
  TrendingMoviesRepository trendingMoviesRepository;

  TrendingMoviesBloc({required this.trendingMoviesRepository})
      : super(TrendingMoviesState(trendingMoviesList: ApiResponse.loading())) {
    on<FetchTrendingMoviesEvent>(_fetchTrendingMovies);
  }

  Future<void> _fetchTrendingMovies(
      FetchTrendingMoviesEvent event, Emitter<TrendingMoviesState> emit) async {
    emit(state.copyWith(trendingMoviesList: ApiResponse.loading()));

    try {
      final trendingList =
          await trendingMoviesRepository.fetchTrendingMoviesList(event.movieId);
      emit(state.copyWith(
          trendingMoviesList: ApiResponse.completed(trendingList)));
    } catch (error) {
      emit(state.copyWith(
          trendingMoviesList: ApiResponse.error(error.toString())));
    }
  }
}
