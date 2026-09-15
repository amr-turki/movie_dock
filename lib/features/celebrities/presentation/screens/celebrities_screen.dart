import 'package:flutter/material.dart';
import 'package:movie_dock_application/core/widgets/custom_tab_bar.dart';

class CelebritiesScreen extends StatelessWidget {
  const CelebritiesScreen({super.key});

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

            CustomTabBar(),
          ],
        ),
      ),
    );
  }
}
