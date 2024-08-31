import 'package:freezed_annotation/freezed_annotation.dart';
part 'genres_model.freezed.dart';
part 'genres_model.g.dart';

@freezed
class GenresModel with _$GenresModel {
  factory GenresModel({
    @Default(0) @JsonKey(name: 'id') int id,
    @Default('') @JsonKey(name: 'name') String name,
  }) = _GenresModel;

  factory GenresModel.fromJson(Map<String, dynamic> json) => _$GenresModelFromJson(json);
}