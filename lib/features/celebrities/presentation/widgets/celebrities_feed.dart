import 'package:flutter/material.dart';
import 'package:movie_dock_application/features/celebrities/domain/entities/celebrities_entitiy.dart';
import 'package:movie_dock_application/features/celebrities/presentation/cubit/popular_celebrities_cubit.dart';

class CelebritiesFeed extends StatelessWidget {
  const CelebritiesFeed({super.key, required this.PopularCelebrities});

  final List<CelebritiesEntity> PopularCelebrities;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 columns
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.6,
      ),
      itemCount: PopularCelebrities.length,

      itemBuilder: (context, index) {
        return Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  PopularCelebrities[index].profilePath!.isNotEmpty
                      ? 'https://media.themoviedb.org/t/p/w600_and_h900_face${PopularCelebrities[index].profilePath}'
                      : 'https://via.placeholder.com/500x750',
                ),
              ),
            ),
            SizedBox(height: 4),
            Text(
              '${PopularCelebrities[index].originalName}',
              maxLines: 1,

              style: TextStyle(
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ],
        );
      },
    );
  }
}
