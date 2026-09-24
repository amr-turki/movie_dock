import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_dock_application/features/series/domain/entities/tv_series_recommendation.dart';
import 'package:movie_dock_application/features/series/presentation/cubit/serie_detail/series_cubit.dart';
import 'package:movie_dock_application/features/series/presentation/cubit/series_credit/serie_credit_cubit.dart';
import 'package:movie_dock_application/features/series/presentation/cubit/series_recommendation/series_cubit.dart';
import 'package:movie_dock_application/features/series/presentation/widgets/serie_details.dart';

class RecommendedSeriesFeed extends StatelessWidget {
  const RecommendedSeriesFeed({super.key, required this.Credits});

  final List<TvSeriesRecommendation> Credits;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Credits.length,

        itemBuilder: (context, index) {
          bool hasProfile =
              Credits[index].posterPath != null &&
              Credits[index].posterPath.isNotEmpty;
          return GestureDetector(
            onTap: () {
              BlocProvider.of<SerieDetailsCubit>(context)
                  .eitherFailureOrSeriesDetailsCubit(id: Credits[index].id);

              BlocProvider.of<SerieCreditCubit>(context)
                  .eitherFailureOrSeriesCreditCubit(id: Credits[index].id);

              BlocProvider.of<SeriesRecommendationCubit>(context)
                  .eitherFailureOrSeriesRecommendation(id: Credits[index].id);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SerieDetails();
                  },
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: hasProfile
                    ? CachedNetworkImage(
                        cacheKey: Credits[index].posterPath,
                        imageUrl:
                            'https://image.tmdb.org/t/p/w342${Credits[index].posterPath}',

                        fit: BoxFit.cover,
                        height: 160,
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
