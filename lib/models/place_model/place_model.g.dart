// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaceImpl _$$PlaceImplFromJson(Map<String, dynamic> json) => _$PlaceImpl(
      fsqId: json['fsqId'] as String,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      chains: json['chains'] as List<dynamic>? ?? const [],
      closedBucket: json['closedBucket'] as String?,
      distance: (json['distance'] as num).toDouble(),
      geocodes: Geocode.fromJson(json['geocodes'] as Map<String, dynamic>),
      link: json['link'] as String,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      name: json['name'] as String,
      relatedPlaces: json['relatedPlaces'] == null
          ? null
          : RelatedPlaces.fromJson(
              json['relatedPlaces'] as Map<String, dynamic>),
      timezone: json['timezone'] as String,
    );

Map<String, dynamic> _$$PlaceImplToJson(_$PlaceImpl instance) =>
    <String, dynamic>{
      'fsqId': instance.fsqId,
      'categories': instance.categories,
      'chains': instance.chains,
      'closedBucket': instance.closedBucket,
      'distance': instance.distance,
      'geocodes': instance.geocodes,
      'link': instance.link,
      'location': instance.location,
      'name': instance.name,
      'relatedPlaces': instance.relatedPlaces,
      'timezone': instance.timezone,
    };

_$GeocodeImpl _$$GeocodeImplFromJson(Map<String, dynamic> json) =>
    _$GeocodeImpl(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$GeocodeImplToJson(_$GeocodeImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    _$LocationImpl(
      country: json['country'] as String,
      crossStreet: json['crossStreet'] as String?,
      formattedAddress: json['formattedAddress'] as String,
      locality: json['locality'] as String,
      region: json['region'] as String,
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'country': instance.country,
      'crossStreet': instance.crossStreet,
      'formattedAddress': instance.formattedAddress,
      'locality': instance.locality,
      'region': instance.region,
    };

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      shortName: json['shortName'] as String,
      pluralName: json['pluralName'] as String,
      icon: Icon.fromJson(json['icon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'shortName': instance.shortName,
      'pluralName': instance.pluralName,
      'icon': instance.icon,
    };

_$IconImpl _$$IconImplFromJson(Map<String, dynamic> json) => _$IconImpl(
      prefix: json['prefix'] as String,
      suffix: json['suffix'] as String,
    );

Map<String, dynamic> _$$IconImplToJson(_$IconImpl instance) =>
    <String, dynamic>{
      'prefix': instance.prefix,
      'suffix': instance.suffix,
    };

_$RelatedPlacesImpl _$$RelatedPlacesImplFromJson(Map<String, dynamic> json) =>
    _$RelatedPlacesImpl(
      parent: Parent.fromJson(json['parent'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RelatedPlacesImplToJson(_$RelatedPlacesImpl instance) =>
    <String, dynamic>{
      'parent': instance.parent,
    };

_$ParentImpl _$$ParentImplFromJson(Map<String, dynamic> json) => _$ParentImpl(
      fsqId: json['fsqId'] as String,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$ParentImplToJson(_$ParentImpl instance) =>
    <String, dynamic>{
      'fsqId': instance.fsqId,
      'categories': instance.categories,
      'name': instance.name,
    };
