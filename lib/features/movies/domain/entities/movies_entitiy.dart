import 'package:happytech_clean_architecture/features/movies/domain/entities/sub_enities/address_entity.dart';

class moviesEntity {
  final String name;
  final String phone;
  final String email;
  final AddressEntity address;

  moviesEntity({
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
  });
}
