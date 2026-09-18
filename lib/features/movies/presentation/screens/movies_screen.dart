import 'package:flutter/material.dart';
import 'package:movie_dock_application/features/movies/presentation/screens/widgets/custom_bottom_navigation_bar.dart';

class moviesScreen extends StatefulWidget {
  const moviesScreen({super.key});

  @override
  State<moviesScreen> createState() => _moviesScreenState();
}

class _moviesScreenState extends State<moviesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          bottom: 66.0,
          right: 63,
          left: 63,
        ),
        child: CustomBottomNavigationBar(
          onTabChanged: () {
            setState(() {});
          },
        ),
      ),
    );
  }
}
