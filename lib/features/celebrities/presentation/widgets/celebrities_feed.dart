import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_dock_application/features/celebrities/domain/entities/celebrities_entitiy.dart';
import 'package:movie_dock_application/features/celebrities/presentation/cubit/celebritiedetails/celebritie_details_cubit.dart';
import 'package:movie_dock_application/features/celebrities/presentation/cubit/combinedcredits/combined_credits_cubit.dart';
import 'package:movie_dock_application/features/celebrities/presentation/widgets/celebritie_details.dart';

class CelebritiesFeed extends StatelessWidget {
  const CelebritiesFeed({super.key, required this.Celebrities});

  final List<CelebritiesEntity> Celebrities;
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
      itemCount: Celebrities.length,

      itemBuilder: (context, index) {
        final actor = Celebrities[index];
        final bool hasProfile =
            actor.profilePath != null && actor.profilePath!.isNotEmpty;
        return GestureDetector(
          onTap: () {
            BlocProvider.of<CelebritieDetailsCubit>(context)
                .eitherFailureOrCelebritieDetails(id: actor.id);
            BlocProvider.of<CombinedCreditsCubit>(context)
                .eitherFailureOrCombinedCredits(id: actor.id);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return CelebritieDetails();
                },
              ),
            );
          },
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: hasProfile
                      ? CachedNetworkImage(
                          imageUrl:
                              'https://image.tmdb.org/t/p/w342${actor.profilePath}',
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
              ),
              SizedBox(height: 4),
              Text(
                '${Celebrities[index].originalName}',
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
        );
      },
    );
  }
}
