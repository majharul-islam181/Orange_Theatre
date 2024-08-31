import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:orange_theatre/data/response/api_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    
    // caching data
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? cashedData = sharedPreferences.getString('upcomingMoviesData');

    if (cashedData != null) {
      UpcomingMoviesModel cashedMovies =
          UpcomingMoviesModel.fromJson(json.decode(cashedData));
      emit(state.copyWith(
          upcomingMoviesList: ApiResponse.completed(cashedMovies)));
    }

    try {
      // Fetch data from the API
      final trendingList =
          await upcomingMoviesRepository.fetchUpcomingMoviesList();
      emit(state.copyWith(
          upcomingMoviesList: ApiResponse.completed(trendingList)));
           // Cache the fetched data for future use
            sharedPreferences.setString(
          'upcomingMoviesData', json.encode(trendingList.toJson()));
    } catch (error) {
      emit(state.copyWith(
          upcomingMoviesList: ApiResponse.error(error.toString())));
    }
  }
}
