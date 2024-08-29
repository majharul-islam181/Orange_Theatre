// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'trending_movies_bloc.dart';

class TrendingMoviesState extends Equatable {
  final ApiResponse<TrendingMoviesModel> trendingMoviesList;

  const TrendingMoviesState({required this.trendingMoviesList});

  TrendingMoviesState copyWith({
    ApiResponse<TrendingMoviesModel>? trendingMoviesList,
  }) {
    return TrendingMoviesState(
      trendingMoviesList: trendingMoviesList ?? this.trendingMoviesList,
    );
  }

  @override
  List<Object?> get props => [trendingMoviesList];
}
