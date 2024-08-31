// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genres_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenresModelImpl _$$GenresModelImplFromJson(Map<String, dynamic> json) =>
    _$GenresModelImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$$GenresModelImplToJson(_$GenresModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
