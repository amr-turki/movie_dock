import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_dock_application/core/widgets/custom_tab_bar.dart';
import 'package:movie_dock_application/features/movies/presentation/cubit/movies_cubit.dart';
import 'package:movie_dock_application/features/movies/presentation/cubit/movies_state.dart';

import 'package:movie_dock_application/features/movies/presentation/screens/widgets/custom_bottom_navigation_bar.dart';
import 'package:movie_dock_application/features/movies/presentation/screens/widgets/movies_feed.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            SizedBox(height: 55),

            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 30),
              child: Text(
                'Movie App',
                style: TextStyle(fontSize: 27, color: Colors.black),
              ),
            ),

            CustomTabBar(choice: 'Movies'),

            Expanded(
              child: BlocBuilder<MoviesCubit, MoviesState>(
                builder: (context, state) {
                  if (state is GetMoviesLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is GetMoviesSuccessfully) {
                    return MoviesFeed(movies: state.movies);
                  } else if (state is GetMoviesFailure) {
                    return Center(child: Text(state.errMessage));
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          bottom: 66.0,
          right: 13,
          left: 13,
        ),
        child: CustomBottomNavigationBar(onTabChanged: () {}),
      ),
    );
  }
}
