import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_dock_application/features/series/presentation/cubit/series_feed/series_cubit.dart';

class TvSeriesBottomNavigationBar extends StatefulWidget {
  const TvSeriesBottomNavigationBar({super.key, required this.onTabChanged});
  final VoidCallback? onTabChanged;
  static String choice = "Airing Today";

  @override
  State<TvSeriesBottomNavigationBar> createState() =>
      _TvSeriesBottomNavigationBarState();
}

class _TvSeriesBottomNavigationBarState
    extends State<TvSeriesBottomNavigationBar> {
  Color color = Colors.deepPurpleAccent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    TvSeriesBottomNavigationBar.choice = "Airing Today";
                    BlocProvider.of<SeriesCubit>(context)
                        .eitherFailureOrSeriesAiringToday();
                    widget.onTabChanged?.call();
                  });
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.today_outlined,
                      size: 20,
                      color:
                          TvSeriesBottomNavigationBar.choice == "Airing Today"
                          ? color
                          : Colors.black,
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Airing Today",
                      style: TextStyle(
                        fontSize: 14,
                        color:
                            TvSeriesBottomNavigationBar.choice == "Airing Today"
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
                    TvSeriesBottomNavigationBar.choice = 'On The Air';
                    BlocProvider.of<SeriesCubit>(context)
                        .eitherFailureOrSeriesOnTheAir();

                    widget.onTabChanged?.call();
                  });
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.live_tv,
                      size: 20,
                      color: TvSeriesBottomNavigationBar.choice == 'On The Air'
                          ? color
                          : Colors.black,
                    ),
                    SizedBox(height: 5),
                    Text(
                      'On The Air',
                      style: TextStyle(
                        fontSize: 14,
                        color:
                            TvSeriesBottomNavigationBar.choice == 'On The Air'
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
                    TvSeriesBottomNavigationBar.choice = 'Popular';
                    BlocProvider.of<SeriesCubit>(context)
                        .eitherFailureOrSeriesPopular();

                    widget.onTabChanged?.call();
                  });
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.favorite,
                      size: 20,
                      color: TvSeriesBottomNavigationBar.choice == 'Popular'
                          ? color
                          : Colors.black,
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Popular',
                      style: TextStyle(
                        fontSize: 14,
                        color: TvSeriesBottomNavigationBar.choice == 'Popular'
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
                    TvSeriesBottomNavigationBar.choice = 'Top Rated';
                    BlocProvider.of<SeriesCubit>(context)
                        .eitherFailureOrSeriesTopRated();

                    widget.onTabChanged?.call();
                  });
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.star,
                      size: 20,
                      color: TvSeriesBottomNavigationBar.choice == 'Top Rated'
                          ? color
                          : Colors.black,
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Top Rated',
                      style: TextStyle(
                        fontSize: 14,
                        color: TvSeriesBottomNavigationBar.choice == 'Top Rated'
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
      ),
    );
  }
}
