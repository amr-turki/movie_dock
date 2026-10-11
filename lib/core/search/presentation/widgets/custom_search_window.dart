import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_dock_application/core/search/presentation/cubit/search_cubit.dart';
import 'package:movie_dock_application/core/search/presentation/cubit/search_state.dart';
import 'package:movie_dock_application/core/utils/custom_cache_manager.dart';
import 'package:movie_dock_application/features/celebrities/presentation/cubit/celebritiedetails/celebritie_details_cubit.dart';
import 'package:movie_dock_application/features/celebrities/presentation/widgets/celebritie_details.dart';
import 'package:movie_dock_application/features/movies/presentation/cubit/movie_details/movie_details_cubit.dart';
import 'package:movie_dock_application/features/movies/presentation/screens/widgets/movie_details.dart';
import 'package:movie_dock_application/features/series/data/models/tv_series_credits_model.dart';
import 'package:movie_dock_application/features/series/domain/entities/tv_series_details_entity.dart';
import 'package:movie_dock_application/features/series/presentation/cubit/serie_detail/series_cubit.dart';
import 'package:movie_dock_application/features/series/presentation/widgets/serie_details.dart';

class CustomSearchWindow extends StatefulWidget {
  const CustomSearchWindow({super.key, required this.onClose});
  final VoidCallback? onClose;

  @override
  State<CustomSearchWindow> createState() => _CustomSearchWindowState();
}

class _CustomSearchWindowState extends State<CustomSearchWindow> {
  String choice = "Movie";
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.trim().isNotEmpty) {
        context.read<SearchCubit>().search(query: query);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),

        TextField(
          controller: _searchController,
          autofocus: true,
          onChanged: _onSearchChanged,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 14),
            hintText: 'Start Searching...',
            suffixIcon: IconButton(
              onPressed: () {
                _searchController.clear();
                if (widget.onClose != null) {
                  widget.onClose!();
                }
              },
              icon: const Icon(Icons.close, size: 24),
            ),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
          ),
        ),

        const SizedBox(height: 15),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  choice = "Movie";
                });
              },
              child: choice == "Movie"
                  ? Container(
                      height: 40,
                      width: 110,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 191, 172, 244),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Row(
                        children: [
                          SizedBox(width: 15),
                          Icon(Icons.check, size: 14, color: Colors.black),
                          SizedBox(width: 10),
                          Text(
                            "Movies",
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      height: 40,
                      width: 110,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 92, 91, 91),
                          width: 1,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Center(
                        child: Text(
                          "Movies",
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ),
                    ),
            ),

            GestureDetector(
              onTap: () {
                setState(() {
                  choice = "TV Series";
                });
              },
              child: choice == "TV Series"
                  ? Container(
                      height: 40,
                      width: 110,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 191, 172, 244),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Row(
                        children: [
                          SizedBox(width: 15),
                          Icon(Icons.check, size: 14, color: Colors.black),
                          SizedBox(width: 5),
                          Text(
                            "TV Series",
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      height: 40,
                      width: 110,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 92, 91, 91),
                          width: 1,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Center(
                        child: Text(
                          "TV Series",
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ),
                    ),
            ),

            GestureDetector(
              onTap: () {
                setState(() {
                  choice = "Celebrities";
                });
              },
              child: choice == "Celebrities"
                  ? Container(
                      height: 40,
                      width: 110,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 191, 172, 244),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Row(
                        children: [
                          SizedBox(width: 15),
                          Icon(Icons.check, size: 14, color: Colors.black),
                          SizedBox(width: 5),
                          Text(
                            "Celebrities",
                            style: TextStyle(fontSize: 13, color: Colors.black),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      height: 40,
                      width: 110,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 92, 91, 91),
                          width: 1,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Center(
                        child: Text(
                          "Celebrities",
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ),
                    ),
            ),
          ],
        ),

        const SizedBox(height: 15),

        Expanded(
          child: BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state is SearchLoading) {
                return const Center(
                  child: CircularProgressIndicator(strokeWidth: 3),
                );
              } else if (state is SearchFailure) {
                return Center(
                  child: Text(
                    state.errMessage,
                    style: const TextStyle(color: Colors.grey),
                  ),
                );
              } else if (state is SearchSuccessfully) {
                final filteredList = state.searchResults.where((item) {
                  if (choice == "Movie") return item.mediaType == "movie";
                  if (choice == "TV Series") return item.mediaType == "tv";
                  if (choice == "Celebrities")
                    return item.mediaType == "person";
                  return true;
                }).toList();

                if (filteredList.isEmpty) {
                  return const Center(
                    child: Text(
                      'No results found for this category',
                      style: TextStyle(color: Colors.grey),
                    ),
                  );
                }

                return ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    final item = filteredList[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: GestureDetector(
                        onTap: () {
                          if (item.mediaType == "movie") {
                            BlocProvider.of<MovieDetailsCubit>(context)
                                .eitherFailureOrMovieCreditCubit(id: item.id);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return MovieDetails();
                                },
                              ),
                            );
                          } else if (item.mediaType == "tv") {
                            BlocProvider.of<SerieDetailsCubit>(context)
                                .eitherFailureOrSeriesDetailsCubit(id: item.id);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return SerieDetails();
                                },
                              ),
                            );
                          } else if (item.mediaType == "person") {
                            BlocProvider.of<CelebritieDetailsCubit>(context)
                                .eitherFailureOrCelebritieDetails(id: item.id);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return CelebritieDetails();
                                },
                              ),
                            );
                          }
                        },
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: SizedBox(
                                width: 90,
                                height: 120,
                                child: CachedNetworkImage(
                                  cacheManager:
                                      CustomImageCacheManager.instance,
                                  imageUrl: item.image.isNotEmpty
                                      ? 'https://image.tmdb.org/t/p/w342${item.image}'
                                      : '',
                                  fit: BoxFit.cover,
                                  height: 120,
                                  width: 90,
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
                                        child: Icon(
                                          choice == "Celebrities"
                                              ? Icons.person
                                              : Icons.movie,
                                          size: 50,
                                          color: Colors.grey,
                                        ),
                                      ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Text(
                                item.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }

              return const Center(
                child: Text(
                  'Start Searching...',
                  style: TextStyle(color: Colors.grey),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
