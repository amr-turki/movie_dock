// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending_celebrities_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TrendingCelebritiesModelAdapter
    extends TypeAdapter<TrendingCelebritiesModel> {
  @override
  final int typeId = 3;

  @override
  TrendingCelebritiesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TrendingCelebritiesModel(
      adult: fields[0] as bool,
      name: fields[1] as String,
      profilePath: fields[3] as String?,
      originalName: fields[4] as String,
      id: fields[5] as int,
      mediaType: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TrendingCelebritiesModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.mediaType)
      ..writeByte(3)
      ..write(obj.profilePath)
      ..writeByte(4)
      ..write(obj.originalName)
      ..writeByte(5)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrendingCelebritiesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
