// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieDetailsModelAdapter extends TypeAdapter<MovieDetailsModel> {
  @override
  final int typeId = 9;

  @override
  MovieDetailsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieDetailsModel(
      id: fields[0] as int,
      originalLanguage: fields[1] as String,
      overview: fields[2] as String,
      posterPath: fields[3] as String,
      originalTitle: fields[4] as String,
      voteAverage: fields[5] as double,
      releaseDate: fields[6] as String,
      runtime: fields[7] as int,
      adult: fields[8] as bool,
      homepage: fields[9] as String?,
      popularity: fields[10] as double,
      status: fields[11] as String,
      tagline: fields[12] as String,
      type: fields[13] as String,
      voteCount: fields[14] as double,
      video: fields[15] as bool,
      buget: fields[16] as int,
    );
  }

  @override
  void write(BinaryWriter writer, MovieDetailsModel obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.originalLanguage)
      ..writeByte(2)
      ..write(obj.overview)
      ..writeByte(3)
      ..write(obj.posterPath)
      ..writeByte(4)
      ..write(obj.originalTitle)
      ..writeByte(5)
      ..write(obj.voteAverage)
      ..writeByte(6)
      ..write(obj.releaseDate)
      ..writeByte(7)
      ..write(obj.runtime)
      ..writeByte(8)
      ..write(obj.adult)
      ..writeByte(9)
      ..write(obj.homepage)
      ..writeByte(10)
      ..write(obj.popularity)
      ..writeByte(11)
      ..write(obj.status)
      ..writeByte(12)
      ..write(obj.tagline)
      ..writeByte(13)
      ..write(obj.type)
      ..writeByte(14)
      ..write(obj.voteCount)
      ..writeByte(15)
      ..write(obj.video)
      ..writeByte(16)
      ..write(obj.buget);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
