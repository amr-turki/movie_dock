import 'package:happytech_clean_architecture/core/databases/api/end_points.dart';
import 'package:happytech_clean_architecture/features/movies/data/models/sub_models/address_model.dart';
import 'package:happytech_clean_architecture/features/movies/data/models/sub_models/company_model.dart';
import 'package:happytech_clean_architecture/features/movies/domain/entities/movies_entitiy.dart';

class moviesModel extends moviesEntity {
  final int id;
  final String moviesname;
  final String website;
  final CompanyModel company;
  moviesModel({
    required this.id,
    required super.name,
    required super.phone,
    required super.email,
    required super.address,
    required this.moviesname,
    required this.website,
    required this.company,
  });

  factory moviesModel.fromJson(Map<String, dynamic> json) {
    return moviesModel(
      id: json[ApiKey.id],
      name: json[ApiKey.name],
      phone: json[ApiKey.phone],
      email: json[ApiKey.email],
      moviesname: json[ApiKey.moviesname],
      website: json[ApiKey.website],
      address: AddressModel.fromJson(json[ApiKey.address]),
      company: CompanyModel.fromJson(json[ApiKey.company]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.id: id,
      ApiKey.name: name,
      ApiKey.email: email,
      ApiKey.phone: phone,
      ApiKey.moviesname: moviesname,
      ApiKey.website: website,
      ApiKey.company: company,
      ApiKey.address: address,
    };
  }
}
