// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_recommendation_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieRecommendationModelAdapter
    extends TypeAdapter<MovieRecommendationModel> {
  @override
  final int typeId = 5;

  @override
  MovieRecommendationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieRecommendationModel(
      id: fields[0] as int,
      posterPath: fields[1] as String,
      adult: fields[2] as bool,
      backDropPath: fields[3] as String,
      title: fields[4] as String,
      originalLanguage: fields[5] as String,
      originalTitle: fields[6] as String,
      overview: fields[7] as String,
      mediaType: fields[8] as String,
      popularity: fields[9] as double,
      voteAverage: fields[10] as double,
      voteCount: fields[11] as double,
    );
  }

  @override
  void write(BinaryWriter writer, MovieRecommendationModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.posterPath)
      ..writeByte(2)
      ..write(obj.adult)
      ..writeByte(3)
      ..write(obj.backDropPath)
      ..writeByte(4)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.originalLanguage)
      ..writeByte(6)
      ..write(obj.originalTitle)
      ..writeByte(7)
      ..write(obj.overview)
      ..writeByte(8)
      ..write(obj.mediaType)
      ..writeByte(9)
      ..write(obj.popularity)
      ..writeByte(10)
      ..write(obj.voteAverage)
      ..writeByte(11)
      ..write(obj.voteCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieRecommendationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
