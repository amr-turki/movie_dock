import 'package:flutter/material.dart';
import 'package:movie_dock_application/features/celebrities/presentation/screens/celebrities_screen.dart';
import 'package:movie_dock_application/features/movies/presentation/screens/movies_screen.dart';

class CustomTabBar extends StatefulWidget {
  CustomTabBar({super.key, required this.choice});
  String? choice = 'Celebrities';

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
                widget.choice = 'Movies';

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
                    color: widget.choice == 'Movies' ? color : Colors.black,
                  ),
                  Text(
                    'Movies',
                    style: TextStyle(
                      fontSize: 16,
                      color: widget.choice == 'Movies' ? color : Colors.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  widget.choice == 'Movies'
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

            Column(
              children: [
                Icon(
                  Icons.tv,
                  size: 24,
                  color: widget.choice == 'TV Series' ? color : Colors.black,
                ),
                Text(
                  'TV Series',
                  style: TextStyle(
                    fontSize: 16,
                    color: widget.choice == 'TV Series' ? color : Colors.black,
                  ),
                ),
                SizedBox(height: 4),

                widget.choice == 'TV Series'
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

            GestureDetector(
              onTap: () {
                widget.choice = 'Celebrities';

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
                    color: widget.choice == 'Celebrities'
                        ? color
                        : Colors.black,
                  ),
                  Text(
                    'Celebrities',
                    style: TextStyle(
                      fontSize: 16,
                      color: widget.choice == 'Celebrities'
                          ? color
                          : Colors.black,
                    ),
                  ),
                  SizedBox(height: 4),

                  widget.choice == 'Celebrities'
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
                  color: widget.choice == 'Favorites' ? color : Colors.black,
                ),
                Text(
                  'Favorites',
                  style: TextStyle(
                    fontSize: 16,
                    color: widget.choice == 'Favorites' ? color : Colors.black,
                  ),
                ),
                SizedBox(height: 4),

                widget.choice == 'Favorites'
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
