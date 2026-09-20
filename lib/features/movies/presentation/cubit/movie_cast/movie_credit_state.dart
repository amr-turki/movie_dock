import 'package:movie_dock_application/features/movies/domain/entities/movie_credit_entity.dart';

abstract class MovieCreditState {}

final class GetMovieCreditInitial extends MovieCreditState {}

final class GetMovieCreditLoading extends MovieCreditState {}

final class GeMovieCreditSuccessfully extends MovieCreditState {
  final List<MovieCreditEntity> credit;

  GeMovieCreditSuccessfully({required this.credit});
}

final class GetMovieCreditFailure extends MovieCreditState {
  final String errMessage;

  GetMovieCreditFailure({required this.errMessage});
}
