// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'upcoming_movies_bloc.dart';

class UpcomingMoviesState extends Equatable {
  final ApiResponse<UpcomingMoviesModel> upcomingMoviesList;

  const UpcomingMoviesState({required this.upcomingMoviesList});

  UpcomingMoviesState copyWith({
    ApiResponse<UpcomingMoviesModel>? upcomingMoviesList,
  }) {
    return UpcomingMoviesState(
      upcomingMoviesList: upcomingMoviesList ?? this.upcomingMoviesList,
    );
  }

  @override
  List<Object?> get props => [upcomingMoviesList];
}
