import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  String? choice = 'Celebrities';
  Color color = Colors.deepPurpleAccent;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Column(
              children: [
                Icon(
                  Icons.movie,
                  size: 24,
                  color: choice == 'Movies' ? color : Colors.black,
                ),
                Text(
                  'Movies',
                  style: TextStyle(
                    fontSize: 16,
                    color: choice == 'Movies' ? color : Colors.black,
                  ),
                ),
                SizedBox(height: 4),
                choice == 'Movies'
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

            Column(
              children: [
                Icon(
                  Icons.tv,
                  size: 24,
                  color: choice == 'TV Series' ? color : Colors.black,
                ),
                Text(
                  'TV Series',
                  style: TextStyle(
                    fontSize: 16,
                    color: choice == 'TV Series' ? color : Colors.black,
                  ),
                ),
                SizedBox(height: 4),

                choice == 'TV Series'
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

            Column(
              children: [
                Icon(
                  Icons.people,
                  size: 24,
                  color: choice == 'Celebrities' ? color : Colors.black,
                ),
                Text(
                  'Celebrities',
                  style: TextStyle(
                    fontSize: 16,
                    color: choice == 'Celebrities' ? color : Colors.black,
                  ),
                ),
                SizedBox(height: 4),

                choice == 'Celebrities'
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
            Column(
              children: [
                Icon(
                  Icons.favorite,
                  size: 24,
                  color: choice == 'Favorites' ? color : Colors.black,
                ),
                Text(
                  'Favorites',
                  style: TextStyle(
                    fontSize: 16,
                    color: choice == 'Favorites' ? color : Colors.black,
                  ),
                ),
                SizedBox(height: 4),

                choice == 'Favorites'
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
