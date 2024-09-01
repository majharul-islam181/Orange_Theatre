// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_model_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavouriteModelHiveAdapter extends TypeAdapter<FavouriteModelHive> {
  @override
  final int typeId = 0;

  @override
  FavouriteModelHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavouriteModelHive(
      id: fields[0] as int,
      originalTitle: fields[1] as String,
      backdropPath: fields[2] as String,
      releaseDate: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FavouriteModelHive obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.originalTitle)
      ..writeByte(2)
      ..write(obj.backdropPath)
      ..writeByte(3)
      ..write(obj.releaseDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavouriteModelHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
