import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_dock_application/core/utils/custom_cache_manager.dart';
import 'package:movie_dock_application/features/celebrities/presentation/cubit/celebritiedetails/celebritie_details_cubit.dart';
import 'package:movie_dock_application/features/celebrities/presentation/cubit/combinedcredits/combined_credits_cubit.dart';
import 'package:movie_dock_application/features/celebrities/presentation/widgets/celebritie_details.dart';
import 'package:movie_dock_application/features/movies/domain/entities/movie_credit_entity.dart';

class CastSMovie extends StatelessWidget {
  const CastSMovie({super.key, required this.Credits});

  final List<MovieCreditEntity> Credits;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Credits.length,

        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              BlocProvider.of<CelebritieDetailsCubit>(context)
                  .eitherFailureOrCelebritieDetails(id: Credits[index].id);

              BlocProvider.of<CombinedCreditsCubit>(context)
                  .eitherFailureOrCombinedCredits(id: Credits[index].id);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CelebritieDetails();
                  },
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: SizedBox(
                        width: 120,
                        height: 180,
                        child: CachedNetworkImage(
                          cacheManager: CustomImageCacheManager.instance,
                          cacheKey: Credits[index].profilePath,
                          imageUrl:
                              'https://image.tmdb.org/t/p/w342${Credits[index].profilePath}',

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
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 4),
                  Text(
                    '${Credits[index].name}',
                    maxLines: 1,

                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
