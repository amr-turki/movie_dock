import 'package:movie_dock_application/features/celebrities/domain/entities/celebritie_combined_credits.dart';

class CombinedCreditsState {}

final class CombinedCreditsInitial extends CombinedCreditsState {}

final class CombinedCreditsSuccessfully extends CombinedCreditsState {
  final List<CelebritieCombinedCredits> CombinedCredits;

  CombinedCreditsSuccessfully({required this.CombinedCredits});
}

final class CombinedCreditsLoading extends CombinedCreditsState {}

final class CombinedCreditsFailure extends CombinedCreditsState {
  final String errMessage;

  CombinedCreditsFailure({required this.errMessage});
}
