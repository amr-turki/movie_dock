import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_dock_application/features/celebrities/presentation/cubit/popular_celebrities_cubit.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  String? choice = 'Popular';
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
                  choice = 'Popular';

                  BlocProvider.of<PopularCelebritiesCubit>(context)
                      .eitherFailureOrPopularCelebritiesInitial(page: 1);
                });
              },
              child: Column(
                children: [
                  Icon(
                    Icons.favorite,
                    size: 24,
                    color: choice == 'Popular' ? color : Colors.black,
                  ),
                  Text(
                    'Popular',
                    style: TextStyle(
                      fontSize: 16,
                      color: choice == 'Popular' ? color : Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            GestureDetector(
              onTap: () {
                setState(() {
                  choice = 'Trending';
                });
              },
              child: Column(
                children: [
                  Icon(
                    Icons.trending_up,
                    size: 24,
                    color: choice == 'Trending' ? color : Colors.black,
                  ),
                  Text(
                    'Trending',
                    style: TextStyle(
                      fontSize: 16,
                      color: choice == 'Trending' ? color : Colors.black,
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
