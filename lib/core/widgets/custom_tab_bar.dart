import 'package:flutter/material.dart';
import 'package:movie_dock_application/features/celebrities/presentation/screens/celebrities_screen.dart';
import 'package:movie_dock_application/features/movies/presentation/screens/movies_screen.dart';
import 'package:movie_dock_application/features/series/presentation/screens/tv_series_screen.dart';

class CustomTabBar extends StatefulWidget {
  CustomTabBar({super.key, required this.onTabChanged});
  final VoidCallback? onTabChanged;
  static String? choice = 'Celebrities';

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
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
                  CustomTabBar.choice = 'Movies';
                  widget.onTabChanged?.call();
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MoviesScreen();
                    },
                  ),
                );
              },
              child: Column(
                children: [
                  Icon(
                    Icons.movie,
                    size: 24,
                    color: CustomTabBar.choice == 'Movies'
                        ? color
                        : Colors.black,
                  ),
                  Text(
                    'Movies',
                    style: TextStyle(
                      fontSize: 16,
                      color: CustomTabBar.choice == 'Movies'
                          ? color
                          : Colors.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  CustomTabBar.choice == 'Movies'
                      ? Container(
                          height: 4,
                          width: 75,
                          decoration: BoxDecoration(
                            color: color,

                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(5),
                            ),
                          ),
                        )
                      : SizedBox(height: 4),
                ],
              ),
            ),

            GestureDetector(
              onTap: () {
                setState(() {
                  CustomTabBar.choice = 'TV Series';
                  widget.onTabChanged?.call();
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return TvSeriesScreen();
                    },
                  ),
                );
              },
              child: Column(
                children: [
                  Icon(
                    Icons.tv,
                    size: 24,
                    color: CustomTabBar.choice == 'TV Series'
                        ? color
                        : Colors.black,
                  ),
                  Text(
                    'TV Series',
                    style: TextStyle(
                      fontSize: 16,
                      color: CustomTabBar.choice == 'TV Series'
                          ? color
                          : Colors.black,
                    ),
                  ),
                  SizedBox(height: 4),

                  CustomTabBar.choice == 'TV Series'
                      ? Container(
                          height: 4,
                          width: 74,
                          decoration: BoxDecoration(
                            color: color,

                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(5),
                            ),
                          ),
                        )
                      : SizedBox(height: 4),
                ],
              ),
            ),

            GestureDetector(
              onTap: () {
                setState(() {
                  CustomTabBar.choice = 'Celebrities';
                  widget.onTabChanged?.call();
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CelebritiesScreen();
                    },
                  ),
                );
              },
              child: Column(
                children: [
                  Icon(
                    Icons.people,
                    size: 24,
                    color: CustomTabBar.choice == 'Celebrities'
                        ? color
                        : Colors.black,
                  ),
                  Text(
                    'Celebrities',
                    style: TextStyle(
                      fontSize: 16,
                      color: CustomTabBar.choice == 'Celebrities'
                          ? color
                          : Colors.black,
                    ),
                  ),
                  SizedBox(height: 4),

                  CustomTabBar.choice == 'Celebrities'
                      ? Container(
                          height: 4,
                          width: 74,
                          decoration: BoxDecoration(
                            color: color,

                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(5),
                            ),
                          ),
                        )
                      : SizedBox(height: 4),
                ],
              ),
            ),
            Column(
              children: [
                Icon(
                  Icons.favorite,
                  size: 24,
                  color: CustomTabBar.choice == 'Favorites'
                      ? color
                      : Colors.black,
                ),
                Text(
                  'Favorites',
                  style: TextStyle(
                    fontSize: 16,
                    color: CustomTabBar.choice == 'Favorites'
                        ? color
                        : Colors.black,
                  ),
                ),
                SizedBox(height: 4),

                CustomTabBar.choice == 'Favorites'
                    ? Container(
                        height: 4,
                        width: 74,
                        decoration: BoxDecoration(
                          color: color,

                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(5),
                          ),
                        ),
                      )
                    : SizedBox(height: 4),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
