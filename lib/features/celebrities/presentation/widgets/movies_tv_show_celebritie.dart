import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_dock_application/features/celebrities/domain/entities/celebritie_combined_credits.dart';
import 'package:movie_dock_application/features/movies/presentation/cubit/movie_cast/movie_credit_cubit.dart';
import 'package:movie_dock_application/features/movies/presentation/cubit/movie_details/movie_details_cubit.dart';
import 'package:movie_dock_application/features/movies/presentation/cubit/movie_recommendation/movie_recommendation_cubit.dart';
import 'package:movie_dock_application/features/movies/presentation/screens/widgets/movie_details.dart';
import 'package:movie_dock_application/features/series/presentation/cubit/serie_detail/series_cubit.dart';
import 'package:movie_dock_application/features/series/presentation/cubit/series_credit/serie_credit_cubit.dart';
import 'package:movie_dock_application/features/series/presentation/cubit/series_recommendation/series_cubit.dart';
import 'package:movie_dock_application/features/series/presentation/widgets/serie_details.dart';

class MoviesTvShowCelebritie extends StatelessWidget {
  const MoviesTvShowCelebritie({super.key, required this.CombinedCredits});

  final List<CelebritieCombinedCredits> CombinedCredits;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: CombinedCredits.length,

        itemBuilder: (context, index) {
          bool hasProfile =
              CombinedCredits[index].posterPath != null &&
              CombinedCredits[index].posterPath.isNotEmpty;
          return GestureDetector(
            onTap: () {
              if (CombinedCredits[index].mediaType == "movie") {
                BlocProvider.of<MovieDetailsCubit>(context)
                    .eitherFailureOrMovieCreditCubit(
                      id: CombinedCredits[index].id,
                    );

                BlocProvider.of<MovieRecommendationCubit>(context)
                    .eitherFailureOrMovieRecommendation(
                      id: CombinedCredits[index].id,
                    );

                BlocProvider.of<MovieCreditCubit>(context)
                    .eitherFailureOrMovieCredit(id: CombinedCredits[index].id);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MovieDetails();
                    },
                  ),
                );
              } else {
                BlocProvider.of<SerieCreditCubit>(context)
                    .eitherFailureOrSeriesCreditCubit(
                      id: CombinedCredits[index].id,
                    );

                BlocProvider.of<SeriesRecommendationCubit>(context)
                    .eitherFailureOrSeriesRecommendation(
                      id: CombinedCredits[index].id,
                    );

                BlocProvider.of<SerieDetailsCubit>(context)
                    .eitherFailureOrSeriesDetailsCubit(
                      id: CombinedCredits[index].id,
                    );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SerieDetails();
                    },
                  ),
                );
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: hasProfile
                    ? CachedNetworkImage(
                        imageUrl:
                            'https://image.tmdb.org/t/p/w342${CombinedCredits[index].posterPath}',

                        fit: BoxFit.cover,
                        height: 100,
                        width: 120,
                        placeholder: (context, url) => Container(
                          color: Colors.grey[200],
                          child: const Center(
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          width: double.infinity,
                          color: Colors.grey[200],
                          child: const Icon(
                            Icons.person,
                            size: 50,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    : Container(
                        width: double.infinity,

                        color: Colors.grey[200],
                        child: const Icon(
                          Icons.person,
                          size: 120,
                          color: Colors.grey,
                        ),
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
