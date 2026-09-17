import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_dock_application/features/celebrities/presentation/cubit/popular/popular_celebrities_cubit.dart';
import 'package:movie_dock_application/features/celebrities/presentation/cubit/trending/trending_celebrities_cubit.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key, required this.onTabChanged});
  static String? choice = 'Popular';
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
                  CustomBottomNavigationBar.choice = 'Popular';

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
                      fontSize: 16,
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
                  CustomBottomNavigationBar.choice = 'Trending';

                  widget.onTabChanged?.call();
                });
              },
              child: Column(
                children: [
                  Icon(
                    Icons.trending_up,
                    size: 24,
                    color: CustomBottomNavigationBar.choice == 'Trending'
                        ? color
                        : Colors.black,
                  ),
                  Text(
                    'Trending',
                    style: TextStyle(
                      fontSize: 16,
                      color: CustomBottomNavigationBar.choice == 'Trending'
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
