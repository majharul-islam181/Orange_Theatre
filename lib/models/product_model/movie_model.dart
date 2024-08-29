import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_model.freezed.dart';
part 'movie_model.g.dart';

@freezed
class MovieModel with _$MovieModel {
  factory MovieModel({
    @Default(false) @JsonKey(name: 'adult') bool adult,
    @Default('') @JsonKey(name: 'backdrop_path') String backdropPath,
    @Default(0) @JsonKey(name: 'budget') int budget,
    @Default([]) @JsonKey(name: 'genres') List<Genre> genres,
    @Default('') @JsonKey(name: 'homepage') String homepage,
    @Default(0) @JsonKey(name: 'id') int id,
    @Default('') @JsonKey(name: 'imdb_id') String imdbId,
    @Default([]) @JsonKey(name: 'origin_country') List<String> originCountry,
    @Default('') @JsonKey(name: 'original_language') String originalLanguage,
    @Default('') @JsonKey(name: 'original_title') String originalTitle,
    @Default('') @JsonKey(name: 'overview') String overview,
    @Default(0.0) @JsonKey(name: 'popularity') double popularity,
    @Default('') @JsonKey(name: 'poster_path') String posterPath,
    @Default([]) @JsonKey(name: 'production_companies') List<ProductionCompany> productionCompanies,
    @Default([]) @JsonKey(name: 'production_countries') List<ProductionCountry> productionCountries,
    @Default('') @JsonKey(name: 'release_date') String releaseDate,
    @Default(0) @JsonKey(name: 'revenue') int revenue,
    @Default(0) @JsonKey(name: 'runtime') int runtime,
    @Default([]) @JsonKey(name: 'spoken_languages') List<SpokenLanguage> spokenLanguages,
    @Default('') @JsonKey(name: 'status') String status,
    @Default('') @JsonKey(name: 'tagline') String tagline,
    @Default('') @JsonKey(name: 'title') String title,
    @Default(false) @JsonKey(name: 'video') bool video,
    @Default(0.0) @JsonKey(name: 'vote_average') double voteAverage,
    @Default(0) @JsonKey(name: 'vote_count') int voteCount,
  }) = _MovieModel;

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);
}

@freezed
class Genre with _$Genre {
  factory Genre({
    @Default(0) @JsonKey(name: 'id') int id,
    @Default('') @JsonKey(name: 'name') String name,
  }) = _Genre;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}

@freezed
class ProductionCompany with _$ProductionCompany {
  factory ProductionCompany({
    @Default(0) @JsonKey(name: 'id') int id,
    @Default('') @JsonKey(name: 'logo_path') String logoPath,
    @Default('') @JsonKey(name: 'name') String name,
    @Default('') @JsonKey(name: 'origin_country') String originCountry,
  }) = _ProductionCompany;

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);
}

@freezed
class ProductionCountry with _$ProductionCountry {
  factory ProductionCountry({
    @Default('') @JsonKey(name: 'iso_3166_1') String iso31661,
    @Default('') @JsonKey(name: 'name') String name,
  }) = _ProductionCountry;

  factory ProductionCountry.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryFromJson(json);
}

@freezed
class SpokenLanguage with _$SpokenLanguage {
  factory SpokenLanguage({
    @Default('') @JsonKey(name: 'english_name') String englishName,
    @Default('') @JsonKey(name: 'iso_639_1') String iso6391,
    @Default('') @JsonKey(name: 'name') String name,
  }) = _SpokenLanguage;

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);
}
