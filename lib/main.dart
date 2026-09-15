import 'package:flutter/material.dart';
import 'package:movie_dock_application/features/celebrities/presentation/screens/celebrities_screen.dart';

void main() {
  runApp(MovieDockApplication());
}

class MovieDockApplication extends StatelessWidget {
  const MovieDockApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: CelebritiesScreen(),
    );
  }
}
