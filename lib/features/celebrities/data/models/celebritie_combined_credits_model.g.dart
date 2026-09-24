// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'celebritie_combined_credits_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CelebritieCombinedCreditsModelAdapter
    extends TypeAdapter<CelebritieCombinedCreditsModel> {
  @override
  final int typeId = 0;

  @override
  CelebritieCombinedCreditsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CelebritieCombinedCreditsModel(
      voteAverage: fields[8] as double,
      voteCount: fields[9] as int,
      adult: fields[0] as bool,
      backdropPath: fields[1] as String,
      mediaType: fields[11] as String,
      originaLanguage: fields[3] as String,
      originalTitle: fields[4] as String,
      overView: fields[5] as String,
      popularity: fields[6] as double,
      title: fields[2] as String,
      video: fields[7] as bool,
      id: fields[10] as int,
      posterPath: fields[12] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CelebritieCombinedCreditsModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.backdropPath)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.originaLanguage)
      ..writeByte(4)
      ..write(obj.originalTitle)
      ..writeByte(5)
      ..write(obj.overView)
      ..writeByte(6)
      ..write(obj.popularity)
      ..writeByte(7)
      ..write(obj.video)
      ..writeByte(8)
      ..write(obj.voteAverage)
      ..writeByte(9)
      ..write(obj.voteCount)
      ..writeByte(10)
      ..write(obj.id)
      ..writeByte(11)
      ..write(obj.mediaType)
      ..writeByte(12)
      ..write(obj.posterPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CelebritieCombinedCreditsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
