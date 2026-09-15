import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_dock_application/core/widgets/custom_tab_bar.dart';
import 'package:movie_dock_application/features/celebrities/presentation/cubit/popular_celebrities_cubit.dart';
import 'package:movie_dock_application/features/celebrities/presentation/cubit/popular_celebrities_state.dart';
import 'package:movie_dock_application/features/celebrities/presentation/widgets/celebrities_feed.dart';
import 'package:movie_dock_application/features/celebrities/presentation/widgets/custom_bottom_navigation_bar.dart';

class CelebritiesScreen extends StatefulWidget {
  const CelebritiesScreen({super.key});

  @override
  State<CelebritiesScreen> createState() => _CelebritiesScreenState();
}

class _CelebritiesScreenState extends State<CelebritiesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<PopularCelebritiesCubit>(context)
        .eitherFailureOrPopularCelebritiesInitial(page: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
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

            Expanded(
              child:
                  BlocBuilder<PopularCelebritiesCubit, PopularCelebritiesState>(
                    builder: (context, state) {
                      if (state is PopularCelebritiesLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is PopularCelebritiesSuccessfully) {
                        return CelebritiesFeed(
                          PopularCelebrities: state.PopularCelebrities,
                        );
                      } else if (state is PopularCelebritiesFailure) {
                        return Center(child: Text(state.errMessage));
                      }

                      return Text('omar');
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
          right: 63,
          left: 63,
        ),
        child: CustomBottomNavigationBar(),
      ),
    );
  }
}
