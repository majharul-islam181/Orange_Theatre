// ignore_for_file: must_be_immutable

part of 'genre_bloc.dart';

abstract class GenreEvent extends Equatable {
  const GenreEvent();

  @override
  List<Object> get props => [];
}

class FetchGenreEvent extends GenreEvent {
  const FetchGenreEvent();
    @override
  List<Object> get props => [];
}
