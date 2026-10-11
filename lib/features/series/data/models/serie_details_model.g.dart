// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serie_details_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SerieDetailsModelAdapter extends TypeAdapter<SerieDetailsModel> {
  @override
  final int typeId = 20;

  @override
  SerieDetailsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SerieDetailsModel(
      id: fields[0] as int,
      backDropPath: fields[1] as String,
      firstAirRunTime: fields[2] as String,
      name: fields[3] as String,
      numberOfEpisodes: fields[4] as int,
      numberOfSeasons: fields[5] as int,
      originalLanguage: fields[6] as String,
      overview: fields[7] as String,
      posterPath: fields[8] as String,
      adult: fields[9] as bool,
      homepage: fields[10] as String?,
      in_production: fields[11] as bool,
      popularity: fields[12] as double,
      status: fields[13] as String,
      tagline: fields[14] as String,
      type: fields[15] as String,
      voteAverage: fields[16] as double,
      voteCount: fields[17] as double,
    );
  }

  @override
  void write(BinaryWriter writer, SerieDetailsModel obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.backDropPath)
      ..writeByte(2)
      ..write(obj.firstAirRunTime)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.numberOfEpisodes)
      ..writeByte(5)
      ..write(obj.numberOfSeasons)
      ..writeByte(6)
      ..write(obj.originalLanguage)
      ..writeByte(7)
      ..write(obj.overview)
      ..writeByte(8)
      ..write(obj.posterPath)
      ..writeByte(9)
      ..write(obj.adult)
      ..writeByte(10)
      ..write(obj.homepage)
      ..writeByte(11)
      ..write(obj.in_production)
      ..writeByte(12)
      ..write(obj.popularity)
      ..writeByte(13)
      ..write(obj.status)
      ..writeByte(14)
      ..write(obj.tagline)
      ..writeByte(15)
      ..write(obj.type)
      ..writeByte(16)
      ..write(obj.voteAverage)
      ..writeByte(17)
      ..write(obj.voteCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SerieDetailsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
