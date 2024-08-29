import 'package:freezed_annotation/freezed_annotation.dart';

part 'upcoming_movies_model.freezed.dart';
part 'upcoming_movies_model.g.dart';

@freezed
class UpcomingMoviesModel with _$UpcomingMoviesModel {
  const factory UpcomingMoviesModel({
    required Dates dates,
    required int page,
    required List<MovieResult> results,
    @JsonKey(name: 'total_pages') required int totalPages,
    @JsonKey(name: 'total_results') required int totalResults,
  }) = _UpcomingMoviesModel;

  factory UpcomingMoviesModel.fromJson(Map<String, dynamic> json) =>
      _$UpcomingMoviesModelFromJson(json);
}

@freezed
class Dates with _$Dates {
  const factory Dates({
    required String maximum,
    required String minimum,
  }) = _Dates;

  factory Dates.fromJson(Map<String, dynamic> json) => _$DatesFromJson(json);
}

@freezed
class MovieResult with _$MovieResult {
  const factory MovieResult({
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
  }) = _MovieResult;

  factory MovieResult.fromJson(Map<String, dynamic> json) =>
      _$MovieResultFromJson(json);
}
