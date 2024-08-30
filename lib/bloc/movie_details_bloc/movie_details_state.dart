part of 'movie_details_bloc.dart';


class MovieDetailsState extends Equatable {
  final ApiResponse<MovieModel> movieDetails;
  const MovieDetailsState({required this.movieDetails});

  MovieDetailsState copyWith({ApiResponse<MovieModel>? movieDetails}) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
    );
  }

  @override
  List<Object?> get props => [movieDetails];
}
