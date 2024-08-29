import 'package:freezed_annotation/freezed_annotation.dart';

part 'trending_movies_model.freezed.dart';
part 'trending_movies_model.g.dart';

@freezed
class TrendingMoviesModel with _$TrendingMoviesModel {
  factory TrendingMoviesModel({
    @Default(1) @JsonKey(name: 'page') int page,
    @Default([]) @JsonKey(name: 'results') List<Movie> results,
    @Default(0) @JsonKey(name: 'total_pages') int totalPages,
    @Default(0) @JsonKey(name: 'total_results') int totalResults,
  }) = _TrendingMoviesModel;

  factory TrendingMoviesModel.fromJson(Map<String, dynamic> json) =>
      _$TrendingMoviesModelFromJson(json);
}

@freezed
class Movie with _$Movie {
  factory Movie({
    @Default(false) @JsonKey(name: 'adult') bool adult,
    @Default('') @JsonKey(name: 'backdrop_path') String backdropPath,
    @Default([]) @JsonKey(name: 'genre_ids') List<int> genreIds,
    @Default(0) @JsonKey(name: 'id') int id,
    @Default('') @JsonKey(name: 'original_language') String originalLanguage,
    @Default('') @JsonKey(name: 'original_title') String originalTitle,
    @Default('') @JsonKey(name: 'overview') String overview,
    @Default(0.0) @JsonKey(name: 'popularity') double popularity,
    @Default('') @JsonKey(name: 'poster_path') String posterPath,
    @Default('') @JsonKey(name: 'release_date') String releaseDate,
    @Default('') @JsonKey(name: 'title') String title,
    @Default(false) @JsonKey(name: 'video') bool video,
    @Default(0.0) @JsonKey(name: 'vote_average') double voteAverage,
    @Default(0) @JsonKey(name: 'vote_count') int voteCount,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}





//flutter pub run build_runner build --delete-conflicting-outputs