import 'package:movie_dock_application/features/celebrities/domain/entities/celebritie_details.dart';

class CelebritieDetailsState {}

final class CelebritieDetailsInitial extends CelebritieDetailsState {}

final class CelebritieDetailsSuccessfully extends CelebritieDetailsState {
  final CelebritieDetail CelebritieDetails;

  CelebritieDetailsSuccessfully({required this.CelebritieDetails});
}

final class CelebritieDetailsLoading extends CelebritieDetailsState {}

final class CelebritieDetailsFailure extends CelebritieDetailsState {
  final String errMessage;

  CelebritieDetailsFailure({required this.errMessage});
}
