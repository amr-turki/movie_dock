// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_series_recommendation_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TvSeriesRecommendationModelAdapter
    extends TypeAdapter<TvSeriesRecommendationModel> {
  @override
  final int typeId = 23;

  @override
  TvSeriesRecommendationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TvSeriesRecommendationModel(
      id: fields[0] as int,
      posterPath: fields[1] as String,
      adult: fields[2] as bool,
      backDropPath: fields[3] as String,
      name: fields[4] as String,
      originalLanguage: fields[5] as String,
      originalName: fields[6] as String,
      overview: fields[7] as String,
      mediaType: fields[8] as String,
      popularity: fields[9] as double,
      firstAirDate: fields[10] as String,
      voteAverage: fields[11] as double,
      voteCount: fields[12] as double,
    );
  }

  @override
  void write(BinaryWriter writer, TvSeriesRecommendationModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.posterPath)
      ..writeByte(2)
      ..write(obj.adult)
      ..writeByte(3)
      ..write(obj.backDropPath)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.originalLanguage)
      ..writeByte(6)
      ..write(obj.originalName)
      ..writeByte(7)
      ..write(obj.overview)
      ..writeByte(8)
      ..write(obj.mediaType)
      ..writeByte(9)
      ..write(obj.popularity)
      ..writeByte(10)
      ..write(obj.firstAirDate)
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
      other is TvSeriesRecommendationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
