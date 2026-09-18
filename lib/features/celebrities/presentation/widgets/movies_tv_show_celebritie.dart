import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_dock_application/features/celebrities/domain/entities/celebritie_combined_credits.dart';

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
          return Padding(
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
          );
        },
      ),
    );
  }
}
