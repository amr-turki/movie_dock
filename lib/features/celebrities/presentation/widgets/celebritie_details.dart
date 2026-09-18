import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_dock_application/features/celebrities/presentation/cubit/celebritiedetails/celebritie_details_cubit.dart';
import 'package:movie_dock_application/features/celebrities/presentation/cubit/celebritiedetails/celebritie_details_state.dart';
import 'package:movie_dock_application/features/celebrities/presentation/cubit/combinedcredits/combined_credits_cubit.dart';
import 'package:movie_dock_application/features/celebrities/presentation/cubit/combinedcredits/combined_credits_state.dart';
import 'package:movie_dock_application/features/celebrities/presentation/widgets/movies_tv_show_celebritie.dart';
import 'package:read_more_text/read_more_text.dart';

class CelebritieDetails extends StatelessWidget {
  const CelebritieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(automaticallyImplyLeading: false),
      body: BlocBuilder<CelebritieDetailsCubit, CelebritieDetailsState>(
        builder: (context, state) {
          if (state is CelebritieDetailsLoading) {
            return Center(child: CircularProgressIndicator(strokeWidth: 5));
          } else if (state is CelebritieDetailsFailure) {
            return Center(child: Text(state.errMessage));
          } else if (state is CelebritieDetailsSuccessfully) {
            bool hasProfile =
                state.CelebritieDetails.profilePath != null &&
                state.CelebritieDetails.profilePath!.isNotEmpty;

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
                          state.CelebritieDetails.name,
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
                                  imageUrl:
                                      'https://image.tmdb.org/t/p/w342${state.CelebritieDetails.profilePath}',
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
                                  '${state.CelebritieDetails.name}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 20,

                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),

                                Text(
                                  'Artist Detail',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black.withOpacity(0.4),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  state.CelebritieDetails.knownForDepartment,

                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Birthday',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  state.CelebritieDetails.birthday,

                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),

                                Text(
                                  'Place of Birth',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black.withOpacity(0.4),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  state.CelebritieDetails.placeOfBirth,

                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Biography',
                      style: TextStyle(
                        fontSize: 27,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    ReadMoreText(
                      state.CelebritieDetails.biography,
                      style: TextStyle(fontSize: 14, color: Colors.black),
                      numLines: 4,
                      readMoreText: 'Show more',
                      readLessText: 'Show less',
                    ),
                    SizedBox(height: 25),
                    Text(
                      'Movies & TV Shows',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),

                    SizedBox(
                      height: 200,
                      child:
                          BlocBuilder<
                            CombinedCreditsCubit,
                            CombinedCreditsState
                          >(
                            builder: (context, state) {
                              if (state is CombinedCreditsFailure) {
                                return Center(child: Text(state.errMessage));
                              } else if (state is CombinedCreditsLoading) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    strokeWidth: 4,
                                  ),
                                );
                              } else if (state is CombinedCreditsSuccessfully) {
                                return MoviesTvShowCelebritie(
                                  CombinedCredits: state.CombinedCredits,
                                );
                              }
                              return SizedBox();
                            },
                          ),
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
