import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:movie_dock_application/features/movies/domain/entities/movies_entitiy.dart';

class MoviesFeed extends StatelessWidget {
  const MoviesFeed({super.key, required this.movies});

  final List<MoviesEntity> movies;
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
      itemCount: movies.length,

      itemBuilder: (context, index) {
        final movie = movies[index];
        final bool hasProfile =
            movie.posterPath != null && movie.posterPath.isNotEmpty;
        return ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: hasProfile
              ? CachedNetworkImage(
                  imageUrl:
                      'https://image.tmdb.org/t/p/w342${movie.posterPath}',
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
