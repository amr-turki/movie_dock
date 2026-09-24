import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_dock_application/features/movies/presentation/cubit/movie_cast/movie_credit_cubit.dart';
import 'package:movie_dock_application/features/movies/presentation/cubit/movie_cast/movie_credit_state.dart';
import 'package:movie_dock_application/features/movies/presentation/cubit/movie_details/movie_details_cubit.dart';
import 'package:movie_dock_application/features/movies/presentation/cubit/movie_details/movie_details_state.dart';
import 'package:movie_dock_application/features/movies/presentation/cubit/movie_recommendation/movie_recommendation_cubit.dart';
import 'package:movie_dock_application/features/movies/presentation/cubit/movie_recommendation/movie_recommendation_state.dart';
import 'package:movie_dock_application/features/movies/presentation/screens/widgets/movie_cast.dart';
import 'package:movie_dock_application/features/movies/presentation/screens/widgets/recommended_movie_feed.dart';
import 'package:read_more_text/read_more_text.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(automaticallyImplyLeading: false),
      body: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
          if (state is GetMovieDetailsLoading) {
            return Center(child: CircularProgressIndicator(strokeWidth: 5));
          } else if (state is GetMovieDetailsFailure) {
            return Center(child: Text(state.errMessage));
          } else if (state is GetMovieDetailsSuccessfully) {
            bool hasProfile =
                state.details.posterPath != null &&
                state.details.posterPath!.isNotEmpty;

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
                          'Movie Detail',
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
                          child: hasProfile
                              ? CachedNetworkImage(
                                  cacheKey: state.details.posterPath,
                                  imageUrl:
                                      'https://image.tmdb.org/t/p/w342${state.details.posterPath}',
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
                                  errorWidget: (context, url, error) =>
                                      Container(
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${state.details.originalTitle}',
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
                                              'Duration',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              '${((state.details.runtime / 60) as num?)?.toInt()}h ${((state.details.runtime % 60) as num?)?.toInt()}m',

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
                                          'Release Date',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '${state.details.releaseDate}',

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
                                              '${state.details.originalLanguage}',

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
                                          'Rating',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '${state.details.voteAverage}',

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
                      state.details.overview,
                      style: TextStyle(fontSize: 14, color: Colors.black),
                      numLines: 4,
                      readMoreText: 'Show more',
                      readLessText: 'Show less',
                    ),
                    SizedBox(height: 25),
                    Text(
                      'Recommended Movies',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),

                    BlocBuilder<
                      MovieRecommendationCubit,
                      MovieRecommendationState
                    >(
                      builder: (context, state) {
                        if (state is GetMovieRecommendationFailure) {
                          return Center(child: Text(state.errMessage));
                        } else if (state is GetMovieRecommendationLoading) {
                          return Center(
                            child: CircularProgressIndicator(strokeWidth: 4),
                          );
                        } else if (state
                            is GetMovieRecommendationSuccessfully) {
                          return RecommendedMovieFeed(Credits: state.movies);
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

                    BlocBuilder<MovieCreditCubit, MovieCreditState>(
                      builder: (context, state) {
                        if (state is GetMovieCreditFailure) {
                          return Center(child: Text(state.errMessage));
                        } else if (state is GetMovieCreditLoading) {
                          return Center(
                            child: CircularProgressIndicator(strokeWidth: 4),
                          );
                        } else if (state is GeMovieCreditSuccessfully) {
                          return CastSMovie(Credits: state.credit);
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
