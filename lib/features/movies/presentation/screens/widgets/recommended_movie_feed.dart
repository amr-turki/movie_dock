import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_dock_application/features/movies/domain/entities/movie_recommendation_entity.dart';
import 'package:movie_dock_application/features/movies/presentation/cubit/movie_cast/movie_credit_cubit.dart';
import 'package:movie_dock_application/features/movies/presentation/cubit/movie_details/movie_details_cubit.dart';
import 'package:movie_dock_application/features/movies/presentation/cubit/movie_recommendation/movie_recommendation_cubit.dart';
import 'package:movie_dock_application/features/movies/presentation/screens/widgets/movie_details.dart';

class RecommendedMovieFeed extends StatelessWidget {
  const RecommendedMovieFeed({super.key, required this.Credits});

  final List<MovieRecommendationEntity> Credits;

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
              BlocProvider.of<MovieDetailsCubit>(context)
                  .eitherFailureOrMovieCreditCubit(id: Credits[index].id);

              BlocProvider.of<MovieCreditCubit>(context)
                  .eitherFailureOrMovieCredit(id: Credits[index].id);

              BlocProvider.of<MovieRecommendationCubit>(context)
                  .eitherFailureOrMovieRecommendation(id: Credits[index].id);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MovieDetails();
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
