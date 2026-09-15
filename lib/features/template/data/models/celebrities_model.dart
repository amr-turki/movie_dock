import '../../domain/entities/celebrities_entitiy.dart';

class CelebritiesModel extends CelebritiesEntity {
  CelebritiesModel();

  factory CelebritiesModel.fromJson(Map<String, dynamic> json) {
    return CelebritiesModel();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}
