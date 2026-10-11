// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_celebrities_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PopularCelebritiesModelAdapter
    extends TypeAdapter<PopularCelebritiesModel> {
  @override
  final int typeId = 2;

  @override
  PopularCelebritiesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PopularCelebritiesModel(
      adult: fields[0] as bool,
      gender: fields[1] as int,
      knownFor: (fields[5] as List).cast<dynamic>(),
      knownForDepartment: fields[2] as String,
      name: fields[3] as String,
      popularity: fields[4] as double,
      profilePath: fields[6] as String?,
      originalName: fields[7] as String,
      id: fields[8] as int,
    );
  }

  @override
  void write(BinaryWriter writer, PopularCelebritiesModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.gender)
      ..writeByte(2)
      ..write(obj.knownForDepartment)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.popularity)
      ..writeByte(5)
      ..write(obj.knownFor)
      ..writeByte(6)
      ..write(obj.profilePath)
      ..writeByte(7)
      ..write(obj.originalName)
      ..writeByte(8)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PopularCelebritiesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
