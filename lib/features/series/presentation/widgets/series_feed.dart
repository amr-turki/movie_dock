import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_dock_application/features/series/domain/entities/tvs_series_entity.dart';

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
        final bool hasProfile =
            serie.posterPath != null && serie.posterPath.isNotEmpty;
        return ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: hasProfile
              ? CachedNetworkImage(
                  imageUrl:
                      'https://image.tmdb.org/t/p/w342${serie.posterPath}',
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
        );
      },
    );
  }
}
