import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:orange_theatre/data/response/api_response.dart';
import '../../models/models.dart';
import '../../repository/repository.dart';
part 'upcoming_movies_event.dart';
part 'upcoming_movies_state.dart';

class UpcomingMoviesBloc
    extends Bloc<UpcomingMoviesEvent, UpcomingMoviesState> {
  UpcomingMoviesRepository upcomingMoviesRepository;

  UpcomingMoviesBloc({required this.upcomingMoviesRepository})
      : super(UpcomingMoviesState(upcomingMoviesList: ApiResponse.loading())) {
    on<FetchUpcomingMoviesEvent>(_fetchTrendingMovies);
  }

  Future<void> _fetchTrendingMovies(
      FetchUpcomingMoviesEvent event, Emitter<UpcomingMoviesState> emit) async {
    emit(state.copyWith(upcomingMoviesList: ApiResponse.loading()));

    try {
      final trendingList =
          await upcomingMoviesRepository.fetchUpcomingMoviesList();
      emit(state.copyWith(
          upcomingMoviesList: ApiResponse.completed(trendingList)));
    } catch (error) {
      emit(state.copyWith(
          upcomingMoviesList: ApiResponse.error(error.toString())));
    }
  }
}
