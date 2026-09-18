import 'package:happytech_clean_architecture/features/movies/domain/entities/movies_entitiy.dart';

class moviesState {}

final class moviesInitial extends moviesState {}

final class UpdateSLider extends moviesState {}

final class GetmoviesSuccessfully extends moviesState {
  final moviesEntity movies;

  GetmoviesSuccessfully({required this.movies});
}

final class GetmoviesLoading extends moviesState {}

final class GetmoviesFailure extends moviesState {
  final String errMessage;

  GetmoviesFailure({required this.errMessage});
}
