// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Place _$PlaceFromJson(Map<String, dynamic> json) {
  return _Place.fromJson(json);
}

/// @nodoc
mixin _$Place {
  String get fsqId => throw _privateConstructorUsedError;
  List<Category> get categories => throw _privateConstructorUsedError;
  List<dynamic> get chains =>
      throw _privateConstructorUsedError; // If you have specific fields, replace dynamic with them
  String? get closedBucket => throw _privateConstructorUsedError;
  double get distance => throw _privateConstructorUsedError;
  Geocode get geocodes => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  Location get location => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  RelatedPlaces? get relatedPlaces => throw _privateConstructorUsedError;
  String get timezone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaceCopyWith<Place> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceCopyWith<$Res> {
  factory $PlaceCopyWith(Place value, $Res Function(Place) then) =
      _$PlaceCopyWithImpl<$Res, Place>;
  @useResult
  $Res call(
      {String fsqId,
      List<Category> categories,
      List<dynamic> chains,
      String? closedBucket,
      double distance,
      Geocode geocodes,
      String link,
      Location location,
      String name,
      RelatedPlaces? relatedPlaces,
      String timezone});

  $GeocodeCopyWith<$Res> get geocodes;
  $LocationCopyWith<$Res> get location;
  $RelatedPlacesCopyWith<$Res>? get relatedPlaces;
}

/// @nodoc
class _$PlaceCopyWithImpl<$Res, $Val extends Place>
    implements $PlaceCopyWith<$Res> {
  _$PlaceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fsqId = null,
    Object? categories = null,
    Object? chains = null,
    Object? closedBucket = freezed,
    Object? distance = null,
    Object? geocodes = null,
    Object? link = null,
    Object? location = null,
    Object? name = null,
    Object? relatedPlaces = freezed,
    Object? timezone = null,
  }) {
    return _then(_value.copyWith(
      fsqId: null == fsqId
          ? _value.fsqId
          : fsqId // ignore: cast_nullable_to_non_nullable
              as String,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      chains: null == chains
          ? _value.chains
          : chains // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      closedBucket: freezed == closedBucket
          ? _value.closedBucket
          : closedBucket // ignore: cast_nullable_to_non_nullable
              as String?,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      geocodes: null == geocodes
          ? _value.geocodes
          : geocodes // ignore: cast_nullable_to_non_nullable
              as Geocode,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      relatedPlaces: freezed == relatedPlaces
          ? _value.relatedPlaces
          : relatedPlaces // ignore: cast_nullable_to_non_nullable
              as RelatedPlaces?,
      timezone: null == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GeocodeCopyWith<$Res> get geocodes {
    return $GeocodeCopyWith<$Res>(_value.geocodes, (value) {
      return _then(_value.copyWith(geocodes: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res> get location {
    return $LocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RelatedPlacesCopyWith<$Res>? get relatedPlaces {
    if (_value.relatedPlaces == null) {
      return null;
    }

    return $RelatedPlacesCopyWith<$Res>(_value.relatedPlaces!, (value) {
      return _then(_value.copyWith(relatedPlaces: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlaceImplCopyWith<$Res> implements $PlaceCopyWith<$Res> {
  factory _$$PlaceImplCopyWith(
          _$PlaceImpl value, $Res Function(_$PlaceImpl) then) =
      __$$PlaceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String fsqId,
      List<Category> categories,
      List<dynamic> chains,
      String? closedBucket,
      double distance,
      Geocode geocodes,
      String link,
      Location location,
      String name,
      RelatedPlaces? relatedPlaces,
      String timezone});

  @override
  $GeocodeCopyWith<$Res> get geocodes;
  @override
  $LocationCopyWith<$Res> get location;
  @override
  $RelatedPlacesCopyWith<$Res>? get relatedPlaces;
}

/// @nodoc
class __$$PlaceImplCopyWithImpl<$Res>
    extends _$PlaceCopyWithImpl<$Res, _$PlaceImpl>
    implements _$$PlaceImplCopyWith<$Res> {
  __$$PlaceImplCopyWithImpl(
      _$PlaceImpl _value, $Res Function(_$PlaceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fsqId = null,
    Object? categories = null,
    Object? chains = null,
    Object? closedBucket = freezed,
    Object? distance = null,
    Object? geocodes = null,
    Object? link = null,
    Object? location = null,
    Object? name = null,
    Object? relatedPlaces = freezed,
    Object? timezone = null,
  }) {
    return _then(_$PlaceImpl(
      fsqId: null == fsqId
          ? _value.fsqId
          : fsqId // ignore: cast_nullable_to_non_nullable
              as String,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      chains: null == chains
          ? _value._chains
          : chains // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      closedBucket: freezed == closedBucket
          ? _value.closedBucket
          : closedBucket // ignore: cast_nullable_to_non_nullable
              as String?,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      geocodes: null == geocodes
          ? _value.geocodes
          : geocodes // ignore: cast_nullable_to_non_nullable
              as Geocode,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      relatedPlaces: freezed == relatedPlaces
          ? _value.relatedPlaces
          : relatedPlaces // ignore: cast_nullable_to_non_nullable
              as RelatedPlaces?,
      timezone: null == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaceImpl implements _Place {
  _$PlaceImpl(
      {required this.fsqId,
      required final List<Category> categories,
      final List<dynamic> chains = const [],
      this.closedBucket,
      required this.distance,
      required this.geocodes,
      required this.link,
      required this.location,
      required this.name,
      this.relatedPlaces,
      required this.timezone})
      : _categories = categories,
        _chains = chains;

  factory _$PlaceImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceImplFromJson(json);

  @override
  final String fsqId;
  final List<Category> _categories;
  @override
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<dynamic> _chains;
  @override
  @JsonKey()
  List<dynamic> get chains {
    if (_chains is EqualUnmodifiableListView) return _chains;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chains);
  }

// If you have specific fields, replace dynamic with them
  @override
  final String? closedBucket;
  @override
  final double distance;
  @override
  final Geocode geocodes;
  @override
  final String link;
  @override
  final Location location;
  @override
  final String name;
  @override
  final RelatedPlaces? relatedPlaces;
  @override
  final String timezone;

  @override
  String toString() {
    return 'Place(fsqId: $fsqId, categories: $categories, chains: $chains, closedBucket: $closedBucket, distance: $distance, geocodes: $geocodes, link: $link, location: $location, name: $name, relatedPlaces: $relatedPlaces, timezone: $timezone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceImpl &&
            (identical(other.fsqId, fsqId) || other.fsqId == fsqId) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._chains, _chains) &&
            (identical(other.closedBucket, closedBucket) ||
                other.closedBucket == closedBucket) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.geocodes, geocodes) ||
                other.geocodes == geocodes) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.relatedPlaces, relatedPlaces) ||
                other.relatedPlaces == relatedPlaces) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      fsqId,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_chains),
      closedBucket,
      distance,
      geocodes,
      link,
      location,
      name,
      relatedPlaces,
      timezone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceImplCopyWith<_$PlaceImpl> get copyWith =>
      __$$PlaceImplCopyWithImpl<_$PlaceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceImplToJson(
      this,
    );
  }
}

abstract class _Place implements Place {
  factory _Place(
      {required final String fsqId,
      required final List<Category> categories,
      final List<dynamic> chains,
      final String? closedBucket,
      required final double distance,
      required final Geocode geocodes,
      required final String link,
      required final Location location,
      required final String name,
      final RelatedPlaces? relatedPlaces,
      required final String timezone}) = _$PlaceImpl;

  factory _Place.fromJson(Map<String, dynamic> json) = _$PlaceImpl.fromJson;

  @override
  String get fsqId;
  @override
  List<Category> get categories;
  @override
  List<dynamic> get chains;
  @override // If you have specific fields, replace dynamic with them
  String? get closedBucket;
  @override
  double get distance;
  @override
  Geocode get geocodes;
  @override
  String get link;
  @override
  Location get location;
  @override
  String get name;
  @override
  RelatedPlaces? get relatedPlaces;
  @override
  String get timezone;
  @override
  @JsonKey(ignore: true)
  _$$PlaceImplCopyWith<_$PlaceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Geocode _$GeocodeFromJson(Map<String, dynamic> json) {
  return _Geocode.fromJson(json);
}

/// @nodoc
mixin _$Geocode {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeocodeCopyWith<Geocode> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeocodeCopyWith<$Res> {
  factory $GeocodeCopyWith(Geocode value, $Res Function(Geocode) then) =
      _$GeocodeCopyWithImpl<$Res, Geocode>;
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class _$GeocodeCopyWithImpl<$Res, $Val extends Geocode>
    implements $GeocodeCopyWith<$Res> {
  _$GeocodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeocodeImplCopyWith<$Res> implements $GeocodeCopyWith<$Res> {
  factory _$$GeocodeImplCopyWith(
          _$GeocodeImpl value, $Res Function(_$GeocodeImpl) then) =
      __$$GeocodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class __$$GeocodeImplCopyWithImpl<$Res>
    extends _$GeocodeCopyWithImpl<$Res, _$GeocodeImpl>
    implements _$$GeocodeImplCopyWith<$Res> {
  __$$GeocodeImplCopyWithImpl(
      _$GeocodeImpl _value, $Res Function(_$GeocodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$GeocodeImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeocodeImpl implements _Geocode {
  _$GeocodeImpl({required this.latitude, required this.longitude});

  factory _$GeocodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeocodeImplFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'Geocode(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeocodeImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeocodeImplCopyWith<_$GeocodeImpl> get copyWith =>
      __$$GeocodeImplCopyWithImpl<_$GeocodeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeocodeImplToJson(
      this,
    );
  }
}

abstract class _Geocode implements Geocode {
  factory _Geocode(
      {required final double latitude,
      required final double longitude}) = _$GeocodeImpl;

  factory _Geocode.fromJson(Map<String, dynamic> json) = _$GeocodeImpl.fromJson;

  @override
  double get latitude;
  @override
  double get longitude;
  @override
  @JsonKey(ignore: true)
  _$$GeocodeImplCopyWith<_$GeocodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Location _$LocationFromJson(Map<String, dynamic> json) {
  return _Location.fromJson(json);
}

/// @nodoc
mixin _$Location {
  String get country => throw _privateConstructorUsedError;
  String? get crossStreet => throw _privateConstructorUsedError;
  String get formattedAddress => throw _privateConstructorUsedError;
  String get locality => throw _privateConstructorUsedError;
  String get region => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationCopyWith<Location> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res, Location>;
  @useResult
  $Res call(
      {String country,
      String? crossStreet,
      String formattedAddress,
      String locality,
      String region});
}

/// @nodoc
class _$LocationCopyWithImpl<$Res, $Val extends Location>
    implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? country = null,
    Object? crossStreet = freezed,
    Object? formattedAddress = null,
    Object? locality = null,
    Object? region = null,
  }) {
    return _then(_value.copyWith(
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      crossStreet: freezed == crossStreet
          ? _value.crossStreet
          : crossStreet // ignore: cast_nullable_to_non_nullable
              as String?,
      formattedAddress: null == formattedAddress
          ? _value.formattedAddress
          : formattedAddress // ignore: cast_nullable_to_non_nullable
              as String,
      locality: null == locality
          ? _value.locality
          : locality // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationImplCopyWith<$Res>
    implements $LocationCopyWith<$Res> {
  factory _$$LocationImplCopyWith(
          _$LocationImpl value, $Res Function(_$LocationImpl) then) =
      __$$LocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String country,
      String? crossStreet,
      String formattedAddress,
      String locality,
      String region});
}

/// @nodoc
class __$$LocationImplCopyWithImpl<$Res>
    extends _$LocationCopyWithImpl<$Res, _$LocationImpl>
    implements _$$LocationImplCopyWith<$Res> {
  __$$LocationImplCopyWithImpl(
      _$LocationImpl _value, $Res Function(_$LocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? country = null,
    Object? crossStreet = freezed,
    Object? formattedAddress = null,
    Object? locality = null,
    Object? region = null,
  }) {
    return _then(_$LocationImpl(
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      crossStreet: freezed == crossStreet
          ? _value.crossStreet
          : crossStreet // ignore: cast_nullable_to_non_nullable
              as String?,
      formattedAddress: null == formattedAddress
          ? _value.formattedAddress
          : formattedAddress // ignore: cast_nullable_to_non_nullable
              as String,
      locality: null == locality
          ? _value.locality
          : locality // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationImpl implements _Location {
  _$LocationImpl(
      {required this.country,
      this.crossStreet,
      required this.formattedAddress,
      required this.locality,
      required this.region});

  factory _$LocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationImplFromJson(json);

  @override
  final String country;
  @override
  final String? crossStreet;
  @override
  final String formattedAddress;
  @override
  final String locality;
  @override
  final String region;

  @override
  String toString() {
    return 'Location(country: $country, crossStreet: $crossStreet, formattedAddress: $formattedAddress, locality: $locality, region: $region)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationImpl &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.crossStreet, crossStreet) ||
                other.crossStreet == crossStreet) &&
            (identical(other.formattedAddress, formattedAddress) ||
                other.formattedAddress == formattedAddress) &&
            (identical(other.locality, locality) ||
                other.locality == locality) &&
            (identical(other.region, region) || other.region == region));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, country, crossStreet, formattedAddress, locality, region);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      __$$LocationImplCopyWithImpl<_$LocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationImplToJson(
      this,
    );
  }
}

abstract class _Location implements Location {
  factory _Location(
      {required final String country,
      final String? crossStreet,
      required final String formattedAddress,
      required final String locality,
      required final String region}) = _$LocationImpl;

  factory _Location.fromJson(Map<String, dynamic> json) =
      _$LocationImpl.fromJson;

  @override
  String get country;
  @override
  String? get crossStreet;
  @override
  String get formattedAddress;
  @override
  String get locality;
  @override
  String get region;
  @override
  @JsonKey(ignore: true)
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

/// @nodoc
mixin _$Category {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get shortName => throw _privateConstructorUsedError;
  String get pluralName => throw _privateConstructorUsedError;
  Icon get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryCopyWith<Category> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res, Category>;
  @useResult
  $Res call(
      {int id, String name, String shortName, String pluralName, Icon icon});

  $IconCopyWith<$Res> get icon;
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res, $Val extends Category>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? shortName = null,
    Object? pluralName = null,
    Object? icon = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      shortName: null == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
      pluralName: null == pluralName
          ? _value.pluralName
          : pluralName // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Icon,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $IconCopyWith<$Res> get icon {
    return $IconCopyWith<$Res>(_value.icon, (value) {
      return _then(_value.copyWith(icon: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CategoryImplCopyWith<$Res>
    implements $CategoryCopyWith<$Res> {
  factory _$$CategoryImplCopyWith(
          _$CategoryImpl value, $Res Function(_$CategoryImpl) then) =
      __$$CategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String name, String shortName, String pluralName, Icon icon});

  @override
  $IconCopyWith<$Res> get icon;
}

/// @nodoc
class __$$CategoryImplCopyWithImpl<$Res>
    extends _$CategoryCopyWithImpl<$Res, _$CategoryImpl>
    implements _$$CategoryImplCopyWith<$Res> {
  __$$CategoryImplCopyWithImpl(
      _$CategoryImpl _value, $Res Function(_$CategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? shortName = null,
    Object? pluralName = null,
    Object? icon = null,
  }) {
    return _then(_$CategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      shortName: null == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
      pluralName: null == pluralName
          ? _value.pluralName
          : pluralName // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Icon,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryImpl implements _Category {
  _$CategoryImpl(
      {required this.id,
      required this.name,
      required this.shortName,
      required this.pluralName,
      required this.icon});

  factory _$CategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String shortName;
  @override
  final String pluralName;
  @override
  final Icon icon;

  @override
  String toString() {
    return 'Category(id: $id, name: $name, shortName: $shortName, pluralName: $pluralName, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName) &&
            (identical(other.pluralName, pluralName) ||
                other.pluralName == pluralName) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, shortName, pluralName, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      __$$CategoryImplCopyWithImpl<_$CategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryImplToJson(
      this,
    );
  }
}

abstract class _Category implements Category {
  factory _Category(
      {required final int id,
      required final String name,
      required final String shortName,
      required final String pluralName,
      required final Icon icon}) = _$CategoryImpl;

  factory _Category.fromJson(Map<String, dynamic> json) =
      _$CategoryImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get shortName;
  @override
  String get pluralName;
  @override
  Icon get icon;
  @override
  @JsonKey(ignore: true)
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Icon _$IconFromJson(Map<String, dynamic> json) {
  return _Icon.fromJson(json);
}

/// @nodoc
mixin _$Icon {
  String get prefix => throw _privateConstructorUsedError;
  String get suffix => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IconCopyWith<Icon> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IconCopyWith<$Res> {
  factory $IconCopyWith(Icon value, $Res Function(Icon) then) =
      _$IconCopyWithImpl<$Res, Icon>;
  @useResult
  $Res call({String prefix, String suffix});
}

/// @nodoc
class _$IconCopyWithImpl<$Res, $Val extends Icon>
    implements $IconCopyWith<$Res> {
  _$IconCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prefix = null,
    Object? suffix = null,
  }) {
    return _then(_value.copyWith(
      prefix: null == prefix
          ? _value.prefix
          : prefix // ignore: cast_nullable_to_non_nullable
              as String,
      suffix: null == suffix
          ? _value.suffix
          : suffix // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IconImplCopyWith<$Res> implements $IconCopyWith<$Res> {
  factory _$$IconImplCopyWith(
          _$IconImpl value, $Res Function(_$IconImpl) then) =
      __$$IconImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String prefix, String suffix});
}

/// @nodoc
class __$$IconImplCopyWithImpl<$Res>
    extends _$IconCopyWithImpl<$Res, _$IconImpl>
    implements _$$IconImplCopyWith<$Res> {
  __$$IconImplCopyWithImpl(_$IconImpl _value, $Res Function(_$IconImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prefix = null,
    Object? suffix = null,
  }) {
    return _then(_$IconImpl(
      prefix: null == prefix
          ? _value.prefix
          : prefix // ignore: cast_nullable_to_non_nullable
              as String,
      suffix: null == suffix
          ? _value.suffix
          : suffix // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IconImpl implements _Icon {
  _$IconImpl({required this.prefix, required this.suffix});

  factory _$IconImpl.fromJson(Map<String, dynamic> json) =>
      _$$IconImplFromJson(json);

  @override
  final String prefix;
  @override
  final String suffix;

  @override
  String toString() {
    return 'Icon(prefix: $prefix, suffix: $suffix)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IconImpl &&
            (identical(other.prefix, prefix) || other.prefix == prefix) &&
            (identical(other.suffix, suffix) || other.suffix == suffix));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, prefix, suffix);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IconImplCopyWith<_$IconImpl> get copyWith =>
      __$$IconImplCopyWithImpl<_$IconImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IconImplToJson(
      this,
    );
  }
}

abstract class _Icon implements Icon {
  factory _Icon({required final String prefix, required final String suffix}) =
      _$IconImpl;

  factory _Icon.fromJson(Map<String, dynamic> json) = _$IconImpl.fromJson;

  @override
  String get prefix;
  @override
  String get suffix;
  @override
  @JsonKey(ignore: true)
  _$$IconImplCopyWith<_$IconImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RelatedPlaces _$RelatedPlacesFromJson(Map<String, dynamic> json) {
  return _RelatedPlaces.fromJson(json);
}

/// @nodoc
mixin _$RelatedPlaces {
  Parent get parent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RelatedPlacesCopyWith<RelatedPlaces> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RelatedPlacesCopyWith<$Res> {
  factory $RelatedPlacesCopyWith(
          RelatedPlaces value, $Res Function(RelatedPlaces) then) =
      _$RelatedPlacesCopyWithImpl<$Res, RelatedPlaces>;
  @useResult
  $Res call({Parent parent});

  $ParentCopyWith<$Res> get parent;
}

/// @nodoc
class _$RelatedPlacesCopyWithImpl<$Res, $Val extends RelatedPlaces>
    implements $RelatedPlacesCopyWith<$Res> {
  _$RelatedPlacesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parent = null,
  }) {
    return _then(_value.copyWith(
      parent: null == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as Parent,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ParentCopyWith<$Res> get parent {
    return $ParentCopyWith<$Res>(_value.parent, (value) {
      return _then(_value.copyWith(parent: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RelatedPlacesImplCopyWith<$Res>
    implements $RelatedPlacesCopyWith<$Res> {
  factory _$$RelatedPlacesImplCopyWith(
          _$RelatedPlacesImpl value, $Res Function(_$RelatedPlacesImpl) then) =
      __$$RelatedPlacesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Parent parent});

  @override
  $ParentCopyWith<$Res> get parent;
}

/// @nodoc
class __$$RelatedPlacesImplCopyWithImpl<$Res>
    extends _$RelatedPlacesCopyWithImpl<$Res, _$RelatedPlacesImpl>
    implements _$$RelatedPlacesImplCopyWith<$Res> {
  __$$RelatedPlacesImplCopyWithImpl(
      _$RelatedPlacesImpl _value, $Res Function(_$RelatedPlacesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parent = null,
  }) {
    return _then(_$RelatedPlacesImpl(
      parent: null == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as Parent,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RelatedPlacesImpl implements _RelatedPlaces {
  _$RelatedPlacesImpl({required this.parent});

  factory _$RelatedPlacesImpl.fromJson(Map<String, dynamic> json) =>
      _$$RelatedPlacesImplFromJson(json);

  @override
  final Parent parent;

  @override
  String toString() {
    return 'RelatedPlaces(parent: $parent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RelatedPlacesImpl &&
            (identical(other.parent, parent) || other.parent == parent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, parent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RelatedPlacesImplCopyWith<_$RelatedPlacesImpl> get copyWith =>
      __$$RelatedPlacesImplCopyWithImpl<_$RelatedPlacesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RelatedPlacesImplToJson(
      this,
    );
  }
}

abstract class _RelatedPlaces implements RelatedPlaces {
  factory _RelatedPlaces({required final Parent parent}) = _$RelatedPlacesImpl;

  factory _RelatedPlaces.fromJson(Map<String, dynamic> json) =
      _$RelatedPlacesImpl.fromJson;

  @override
  Parent get parent;
  @override
  @JsonKey(ignore: true)
  _$$RelatedPlacesImplCopyWith<_$RelatedPlacesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Parent _$ParentFromJson(Map<String, dynamic> json) {
  return _Parent.fromJson(json);
}

/// @nodoc
mixin _$Parent {
  String get fsqId => throw _privateConstructorUsedError;
  List<Category> get categories => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ParentCopyWith<Parent> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParentCopyWith<$Res> {
  factory $ParentCopyWith(Parent value, $Res Function(Parent) then) =
      _$ParentCopyWithImpl<$Res, Parent>;
  @useResult
  $Res call({String fsqId, List<Category> categories, String name});
}

/// @nodoc
class _$ParentCopyWithImpl<$Res, $Val extends Parent>
    implements $ParentCopyWith<$Res> {
  _$ParentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fsqId = null,
    Object? categories = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      fsqId: null == fsqId
          ? _value.fsqId
          : fsqId // ignore: cast_nullable_to_non_nullable
              as String,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ParentImplCopyWith<$Res> implements $ParentCopyWith<$Res> {
  factory _$$ParentImplCopyWith(
          _$ParentImpl value, $Res Function(_$ParentImpl) then) =
      __$$ParentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String fsqId, List<Category> categories, String name});
}

/// @nodoc
class __$$ParentImplCopyWithImpl<$Res>
    extends _$ParentCopyWithImpl<$Res, _$ParentImpl>
    implements _$$ParentImplCopyWith<$Res> {
  __$$ParentImplCopyWithImpl(
      _$ParentImpl _value, $Res Function(_$ParentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fsqId = null,
    Object? categories = null,
    Object? name = null,
  }) {
    return _then(_$ParentImpl(
      fsqId: null == fsqId
          ? _value.fsqId
          : fsqId // ignore: cast_nullable_to_non_nullable
              as String,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ParentImpl implements _Parent {
  _$ParentImpl(
      {required this.fsqId,
      required final List<Category> categories,
      required this.name})
      : _categories = categories;

  factory _$ParentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParentImplFromJson(json);

  @override
  final String fsqId;
  final List<Category> _categories;
  @override
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final String name;

  @override
  String toString() {
    return 'Parent(fsqId: $fsqId, categories: $categories, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParentImpl &&
            (identical(other.fsqId, fsqId) || other.fsqId == fsqId) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fsqId,
      const DeepCollectionEquality().hash(_categories), name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ParentImplCopyWith<_$ParentImpl> get copyWith =>
      __$$ParentImplCopyWithImpl<_$ParentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ParentImplToJson(
      this,
    );
  }
}

abstract class _Parent implements Parent {
  factory _Parent(
      {required final String fsqId,
      required final List<Category> categories,
      required final String name}) = _$ParentImpl;

  factory _Parent.fromJson(Map<String, dynamic> json) = _$ParentImpl.fromJson;

  @override
  String get fsqId;
  @override
  List<Category> get categories;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$ParentImplCopyWith<_$ParentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
