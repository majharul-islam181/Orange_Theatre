import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_model.freezed.dart';
part 'place_model.g.dart';

@freezed
class Place with _$Place {
  factory Place({
    required String fsqId,
    required List<Category> categories,
    @Default([]) List<dynamic> chains, // If you have specific fields, replace dynamic with them
    String? closedBucket,
    required double distance,
    required Geocode geocodes,
    required String link,
    required Location location,
    required String name,
    RelatedPlaces? relatedPlaces,
    required String timezone,
  }) = _Place;

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);
}

@freezed
class Geocode with _$Geocode {
  factory Geocode({
    required double latitude,
    required double longitude,
  }) = _Geocode;

  factory Geocode.fromJson(Map<String, dynamic> json) => _$GeocodeFromJson(json);
}

@freezed
class Location with _$Location {
  factory Location({
    required String country,
    String? crossStreet,
    required String formattedAddress,
    required String locality,
    required String region,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
}

@freezed
class Category with _$Category {
  factory Category({
    required int id,
    required String name,
    required String shortName,
    required String pluralName,
    required Icon icon,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}

@freezed
class Icon with _$Icon {
  factory Icon({
    required String prefix,
    required String suffix,
  }) = _Icon;

  factory Icon.fromJson(Map<String, dynamic> json) => _$IconFromJson(json);
}

@freezed
class RelatedPlaces with _$RelatedPlaces {
  factory RelatedPlaces({
    required Parent parent,
  }) = _RelatedPlaces;

  factory RelatedPlaces.fromJson(Map<String, dynamic> json) => _$RelatedPlacesFromJson(json);
}

@freezed
class Parent with _$Parent {
  factory Parent({
    required String fsqId,
    required List<Category> categories,
    required String name,
  }) = _Parent;

  factory Parent.fromJson(Map<String, dynamic> json) => _$ParentFromJson(json);
}
