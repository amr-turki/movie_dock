import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_dock_application/core/utils/custom_cache_manager.dart';
import 'package:movie_dock_application/features/series/domain/entities/tvs_series_entity.dart';
import 'package:movie_dock_application/features/series/presentation/cubit/serie_detail/series_cubit.dart';
import 'package:movie_dock_application/features/series/presentation/cubit/series_credit/serie_credit_cubit.dart';
import 'package:movie_dock_application/features/series/presentation/cubit/series_recommendation/series_cubit.dart';
import 'package:movie_dock_application/features/series/presentation/widgets/serie_details.dart';

class SeriesFeed extends StatelessWidget {
  const SeriesFeed({super.key, required this.series});

  final List<TvsSeriesEntity> series;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 columns
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.6,
      ),
      itemCount: series.length,

      itemBuilder: (context, index) {
        final serie = series[index];

        return GestureDetector(
          onTap: () {
            BlocProvider.of<SerieCreditCubit>(context)
                .eitherFailureOrSeriesCreditCubit(id: serie.id);

            BlocProvider.of<SeriesRecommendationCubit>(context)
                .eitherFailureOrSeriesRecommendation(id: serie.id);

            BlocProvider.of<SerieDetailsCubit>(context)
                .eitherFailureOrSeriesDetailsCubit(id: serie.id);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SerieDetails();
                },
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              cacheManager: CustomImageCacheManager.instance,
              cacheKey: serie.posterPath,
              imageUrl: 'https://image.tmdb.org/t/p/w342${serie.posterPath}',
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: Colors.grey[200],
                child: const Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                width: double.infinity,
                color: Colors.grey[200],
                child: const Icon(Icons.person, size: 50, color: Colors.grey),
              ),
            ),
          ),
        );
      },
    );
  }
}
