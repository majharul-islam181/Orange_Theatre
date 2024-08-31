import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:orange_theatre/data/response/api_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/models.dart';
import '../../repository/repository.dart';
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

    // caching data
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? cashedData = sharedPreferences.getString('trendingMoviesData');

    if (cashedData != null) {
      TrendingMoviesModel cashedMovies =
          TrendingMoviesModel.fromJson(json.decode(cashedData));
      emit(state.copyWith(
          trendingMoviesList: ApiResponse.completed(cashedMovies)));
    }

    try {
      // Fetch data from the API
      final trendingList =
          await trendingMoviesRepository.fetchTrendingMoviesList();
      emit(state.copyWith(
          trendingMoviesList: ApiResponse.completed(trendingList)));
      // Cache the fetched data for future use
      sharedPreferences.setString(
          'trendingMoviesData', json.encode(trendingList.toJson()));
    } catch (error) {
      if (kDebugMode) {
        print("error in trending api bloc");
      }
      emit(state.copyWith(
          trendingMoviesList: ApiResponse.error(error.toString())));
    }
  }
}
