import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_dock_application/core/utils/custom_cache_manager.dart';
import 'package:movie_dock_application/features/series/presentation/cubit/serie_detail/series_cubit.dart';
import 'package:movie_dock_application/features/series/presentation/cubit/serie_detail/series_state.dart';
import 'package:movie_dock_application/features/series/presentation/cubit/series_credit/serie_credit_cubit.dart';
import 'package:movie_dock_application/features/series/presentation/cubit/series_credit/series_credit_state.dart';
import 'package:movie_dock_application/features/series/presentation/cubit/series_recommendation/series_cubit.dart';
import 'package:movie_dock_application/features/series/presentation/cubit/series_recommendation/series_state.dart';
import 'package:movie_dock_application/features/series/presentation/widgets/cast_serie.dart';
import 'package:movie_dock_application/features/series/presentation/widgets/recommended_series_feed.dart';
import 'package:read_more_text/read_more_text.dart';

class SerieDetails extends StatelessWidget {
  const SerieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(automaticallyImplyLeading: false),
      body: BlocBuilder<SerieDetailsCubit, SerieDetailsState>(
        builder: (context, state) {
          if (state is GetSerieDetailsLoading) {
            return Center(child: CircularProgressIndicator(strokeWidth: 5));
          } else if (state is GetSerieDetailsFailure) {
            return Center(child: Text(state.errMessage));
          } else if (state is GetSerieDetailsSuccessfully) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 55),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back, size: 24),
                        ),
                        Text(
                          'Serie Detail',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite_border, size: 24),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),

                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: CachedNetworkImage(
                            cacheManager: CustomImageCacheManager.instance,
                            cacheKey: state.serie.posterPath,
                            imageUrl:
                                'https://image.tmdb.org/t/p/w342${state.serie.posterPath}',
                            fit: BoxFit.cover,
                            width: 125,
                            height: 170,
                            placeholder: (context, url) => Container(
                              color: Colors.grey[200],
                              child: const Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${state.serie.name}',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 20,

                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'No. Seasons',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              '${state.serie.numberOfSeasons}',

                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black.withOpacity(
                                                  0.4,
                                                ),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'No. Episodes',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '${state.serie.numberOfEpisodes}',

                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black.withOpacity(
                                              0.4,
                                            ),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'Language',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              '${state.serie.originalLanguage}',

                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black.withOpacity(
                                                  0.4,
                                                ),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'First Air Runtime',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '${state.serie.firstAirRunTime}',

                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black.withOpacity(
                                              0.4,
                                            ),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),

                    Text(
                      'Descripton',
                      style: TextStyle(
                        fontSize: 27,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    ReadMoreText(
                      state.serie.overview,
                      style: TextStyle(fontSize: 14, color: Colors.black),
                      numLines: 4,
                      readMoreText: 'Show more',
                      readLessText: 'Show less',
                    ),
                    SizedBox(height: 25),
                    Text(
                      'Recommended Series',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),

                    BlocBuilder<
                      SeriesRecommendationCubit,
                      SeriesRecommendationState
                    >(
                      builder: (context, state) {
                        if (state is GetSeriesRecommendationFailure) {
                          return Center(child: Text(state.errMessage));
                        } else if (state is GetSeriesRecommendationLoading) {
                          return Center(
                            child: CircularProgressIndicator(strokeWidth: 4),
                          );
                        } else if (state
                            is GetSeriesRecommendationSuccessfully) {
                          return RecommendedSeriesFeed(Credits: state.series);
                        }

                        return SizedBox();
                      },
                    ),

                    SizedBox(height: 25),
                    Text(
                      'Cast',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),

                    BlocBuilder<SerieCreditCubit, SerieCastState>(
                      builder: (context, state) {
                        if (state is GetSerieCastFailure) {
                          return Center(child: Text(state.errMessage));
                        } else if (state is GetSerieCastLoading) {
                          return Center(
                            child: CircularProgressIndicator(strokeWidth: 4),
                          );
                        } else if (state is GetSerieCastSuccessfully) {
                          return CastSerie(Credits: state.cast);
                        }
                        return SizedBox();
                      },
                    ),
                    SizedBox(height: 100),
                  ],
                ),
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
