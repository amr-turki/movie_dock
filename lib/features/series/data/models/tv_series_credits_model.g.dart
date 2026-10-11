// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_series_credits_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TvSeriesCreditsModelAdapter extends TypeAdapter<TvSeriesCreditsModel> {
  @override
  final int typeId = 22;

  @override
  TvSeriesCreditsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TvSeriesCreditsModel(
      id: fields[0] as int,
      profilePath: fields[1] as String,
      name: fields[2] as String,
      adult: fields[3] as bool,
      gender: fields[4] as int,
      knownForDepartment: fields[5] as String,
      originalName: fields[6] as String,
      popularity: fields[7] as double,
      character: fields[8] as String,
      creditId: fields[9] as String,
      order: fields[10] as int,
    );
  }

  @override
  void write(BinaryWriter writer, TvSeriesCreditsModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.profilePath)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.adult)
      ..writeByte(4)
      ..write(obj.gender)
      ..writeByte(5)
      ..write(obj.knownForDepartment)
      ..writeByte(6)
      ..write(obj.originalName)
      ..writeByte(7)
      ..write(obj.popularity)
      ..writeByte(8)
      ..write(obj.character)
      ..writeByte(9)
      ..write(obj.creditId)
      ..writeByte(10)
      ..write(obj.order);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TvSeriesCreditsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
