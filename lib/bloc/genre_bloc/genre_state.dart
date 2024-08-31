part of 'genre_bloc.dart';


class GenreState extends Equatable {
  final ApiResponse<GenresModel> genreList;
  const GenreState({required this.genreList});

  GenreState copyWith({ApiResponse<GenresModel>? genreList}) {
    return GenreState(
      genreList: genreList ?? this.genreList,
    );
  }

  @override
  List<Object?> get props => [genreList];
}
