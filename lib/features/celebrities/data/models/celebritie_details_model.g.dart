// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'celebritie_details_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CelebritieDetailsModelAdapter
    extends TypeAdapter<CelebritieDetailsModel> {
  @override
  final int typeId = 1;

  @override
  CelebritieDetailsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CelebritieDetailsModel(
      gender: fields[2] as int,
      adult: fields[0] as bool,
      imdbId: fields[1] as String,
      popularity: fields[3] as double,
      biography: fields[4] as String,
      birthday: fields[5] as String,
      id: fields[6] as int,
      knownForDepartment: fields[7] as String,
      name: fields[8] as String,
      placeOfBirth: fields[9] as String,
      profilePath: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CelebritieDetailsModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.imdbId)
      ..writeByte(2)
      ..write(obj.gender)
      ..writeByte(3)
      ..write(obj.popularity)
      ..writeByte(4)
      ..write(obj.biography)
      ..writeByte(5)
      ..write(obj.birthday)
      ..writeByte(6)
      ..write(obj.id)
      ..writeByte(7)
      ..write(obj.knownForDepartment)
      ..writeByte(8)
      ..write(obj.name)
      ..writeByte(9)
      ..write(obj.placeOfBirth)
      ..writeByte(10)
      ..write(obj.profilePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CelebritieDetailsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
