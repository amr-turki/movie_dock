// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SeriesModelAdapter extends TypeAdapter<SeriesModel> {
  @override
  final int typeId = 21;

  @override
  SeriesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SeriesModel(
      id: fields[0] as int,
      posterPath: fields[1] as String,
      backDropPath: fields[2] as String,
      firstAirDate: fields[3] as String,
      name: fields[4] as String,
      originalLanguage: fields[5] as String,
      originalName: fields[6] as String,
      overview: fields[7] as String,
      popularity: fields[8] as double,
      voteAverage: fields[9] as double,
      voteCount: fields[10] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SeriesModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.posterPath)
      ..writeByte(2)
      ..write(obj.backDropPath)
      ..writeByte(3)
      ..write(obj.firstAirDate)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.originalLanguage)
      ..writeByte(6)
      ..write(obj.originalName)
      ..writeByte(7)
      ..write(obj.overview)
      ..writeByte(8)
      ..write(obj.popularity)
      ..writeByte(9)
      ..write(obj.voteAverage)
      ..writeByte(10)
      ..write(obj.voteCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SeriesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
