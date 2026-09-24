import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_dock_application/features/movies/domain/entities/movies_entitiy.dart';
import 'package:movie_dock_application/features/movies/presentation/cubit/movie_cast/movie_credit_cubit.dart';
import 'package:movie_dock_application/features/movies/presentation/cubit/movie_details/movie_details_cubit.dart';
import 'package:movie_dock_application/features/movies/presentation/cubit/movie_recommendation/movie_recommendation_cubit.dart';
import 'package:movie_dock_application/features/movies/presentation/screens/widgets/movie_details.dart';

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
        return GestureDetector(
          onTap: () {
            BlocProvider.of<MovieDetailsCubit>(context)
                .eitherFailureOrMovieCreditCubit(id: movie.id);

            BlocProvider.of<MovieRecommendationCubit>(context)
                .eitherFailureOrMovieRecommendation(id: movie.id);

            BlocProvider.of<MovieCreditCubit>(context)
                .eitherFailureOrMovieCredit(id: movie.id);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return MovieDetails();
                },
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: hasProfile
                ? CachedNetworkImage(
                    cacheKey: movie.posterPath,
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
          ),
        );
      },
    );
  }
}
