// ignore_for_file: must_be_immutable

part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();

  @override
  List<Object> get props => [];
}

class FetchMovieDetailsEvent extends MovieDetailsEvent {
  final int movieId;
  const FetchMovieDetailsEvent(this.movieId);
    @override
  List<Object> get props => [movieId];
}
