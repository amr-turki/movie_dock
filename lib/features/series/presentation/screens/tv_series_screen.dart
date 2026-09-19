import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_dock_application/core/widgets/custom_tab_bar.dart';
import 'package:movie_dock_application/features/series/presentation/cubit/series_feed/series_cubit.dart';
import 'package:movie_dock_application/features/series/presentation/cubit/series_feed/series_state.dart';
import 'package:movie_dock_application/features/series/presentation/widgets/series_feed.dart';
import 'package:movie_dock_application/features/series/presentation/widgets/tv_series_bottom_navigation_bar.dart';

class TvSeriesScreen extends StatefulWidget {
  const TvSeriesScreen({super.key});

  @override
  State<TvSeriesScreen> createState() => _TvSeriesScreenState();
}

class _TvSeriesScreenState extends State<TvSeriesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<SeriesCubit>(context).eitherFailureOrSeriesAiringToday();
  }

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

            CustomTabBar(
              onTabChanged: () {
                setState(() {});
              },
            ),

            Expanded(
              child: BlocBuilder<SeriesCubit, SeriesState>(
                builder: (context, state) {
                  if (state is GetSeriesSuccessfully) {
                    return SeriesFeed(series: state.series);
                  } else if (state is GetSeriesLoading) {
                    return Center(
                      child: CircularProgressIndicator(strokeWidth: 4),
                    );
                  } else if (state is GetSeriesFailure) {
                    return Center(child: Text(state.errMessage));
                  }

                  return SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          bottom: 55.0,
          right: 10,
          left: 10,
        ),
        child: TvSeriesBottomNavigationBar(
          onTabChanged: () {
            setState(() {});
          },
        ),
      ),
    );
  }
}
