import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_dock_application/features/movies/presentation/cubit/movies_cubit.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key, required this.onTabChanged});
  static String? choice = 'Now Playing';
  final VoidCallback? onTabChanged;
  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  Color color = Colors.deepPurpleAccent;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  CustomBottomNavigationBar.choice = 'Now Playing';
                  BlocProvider.of<MoviesCubit>(context)
                      .eitherFailureOrMoviesNowPlaying();
                  widget.onTabChanged?.call();
                });
              },
              child: Column(
                children: [
                  Icon(
                    Icons.movie_creation_outlined,
                    size: 24,
                    color: CustomBottomNavigationBar.choice == 'Now Playing'
                        ? color
                        : Colors.black,
                  ),
                  Text(
                    'Now Playing',
                    style: TextStyle(
                      fontSize: 14,
                      color: CustomBottomNavigationBar.choice == 'Now Playing'
                          ? color
                          : Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            GestureDetector(
              onTap: () {
                setState(() {
                  CustomBottomNavigationBar.choice = 'Top Rated';
                  BlocProvider.of<MoviesCubit>(context)
                      .eitherFailureOrMoviesTopRated();
                  widget.onTabChanged?.call();
                });
              },
              child: Column(
                children: [
                  Icon(
                    Icons.tv,
                    size: 24,
                    color: CustomBottomNavigationBar.choice == 'Top Rated'
                        ? color
                        : Colors.black,
                  ),
                  Text(
                    'Top Rated',
                    style: TextStyle(
                      fontSize: 14,
                      color: CustomBottomNavigationBar.choice == 'Top Rated'
                          ? color
                          : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  CustomBottomNavigationBar.choice = 'Popular';
                  BlocProvider.of<MoviesCubit>(context)
                      .eitherFailureOrMoviesPopularList();
                  widget.onTabChanged?.call();
                });
              },
              child: Column(
                children: [
                  Icon(
                    Icons.favorite,
                    size: 24,
                    color: CustomBottomNavigationBar.choice == 'Popular'
                        ? color
                        : Colors.black,
                  ),
                  Text(
                    'Popular',
                    style: TextStyle(
                      fontSize: 14,
                      color: CustomBottomNavigationBar.choice == 'Popular'
                          ? color
                          : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  CustomBottomNavigationBar.choice = 'Upcoming';
                  BlocProvider.of<MoviesCubit>(context)
                      .eitherFailureOrMoviesUpcomingList();
                  widget.onTabChanged?.call();
                });
              },
              child: Column(
                children: [
                  Icon(
                    Icons.upcoming,
                    size: 24,
                    color: CustomBottomNavigationBar.choice == 'Upcoming'
                        ? color
                        : Colors.black,
                  ),
                  Text(
                    'Upcoming',
                    style: TextStyle(
                      fontSize: 14,
                      color: CustomBottomNavigationBar.choice == 'Upcoming'
                          ? color
                          : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
