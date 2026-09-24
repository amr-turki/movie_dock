// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MoviesModelAdapter extends TypeAdapter<MoviesModel> {
  @override
  final int typeId = 6;

  @override
  MoviesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MoviesModel(
      id: fields[0] as int,
      posterPath: fields[1] as String,
      adult: fields[2] as bool,
      backdropPath: fields[3] as String,
      originalLanguage: fields[4] as String,
      originalTitle: fields[5] as String,
      overview: fields[6] as String,
      popularity: fields[7] as double,
      releaseDate: fields[8] as String,
      title: fields[9] as String,
      video: fields[10] as bool,
      voteAverage: fields[11] as double,
      voteCount: fields[12] as int,
    );
  }

  @override
  void write(BinaryWriter writer, MoviesModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.posterPath)
      ..writeByte(2)
      ..write(obj.adult)
      ..writeByte(3)
      ..write(obj.backdropPath)
      ..writeByte(4)
      ..write(obj.originalLanguage)
      ..writeByte(5)
      ..write(obj.originalTitle)
      ..writeByte(6)
      ..write(obj.overview)
      ..writeByte(7)
      ..write(obj.popularity)
      ..writeByte(8)
      ..write(obj.releaseDate)
      ..writeByte(9)
      ..write(obj.title)
      ..writeByte(10)
      ..write(obj.video)
      ..writeByte(11)
      ..write(obj.voteAverage)
      ..writeByte(12)
      ..write(obj.voteCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoviesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
