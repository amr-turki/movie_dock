import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_dock_application/features/celebrities/presentation/cubit/celebritiedetails/celebritie_details_cubit.dart';
import 'package:movie_dock_application/features/celebrities/presentation/cubit/combinedcredits/combined_credits_cubit.dart';
import 'package:movie_dock_application/features/celebrities/presentation/cubit/popular/popular_celebrities_cubit.dart';
import 'package:movie_dock_application/features/celebrities/presentation/cubit/trending/trending_celebrities_cubit.dart';
import 'package:movie_dock_application/features/celebrities/presentation/screens/celebrities_screen.dart';
import 'package:movie_dock_application/features/movies/presentation/cubit/movies_cubit.dart';
import 'package:movie_dock_application/features/movies/presentation/screens/movies_screen.dart';

void main() {
  runApp(MovieDockApplication());
}

class MovieDockApplication extends StatelessWidget {
  const MovieDockApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              PopularCelebritiesCubit()
                ..eitherFailureOrPopularCelebritiesInitial(page: 1),
        ),
        BlocProvider(
          create: (context) =>
              TrendingCelebritiesCubit()
                ..eitherFailureOrTrendingCelebritiesInitial(),
        ),
        BlocProvider(create: (context) => CombinedCreditsCubit()),
        BlocProvider(create: (context) => CelebritieDetailsCubit()),
        BlocProvider(
          create: (context) => MoviesCubit()..eitherFailureOrMoviesNowPlaying(),
        ),

        BlocProvider(
          create: (context) =>
              MoviesCubit()..eitherFailureOrMoviesPopularList(),
        ),

        BlocProvider(
          create: (context) => MoviesCubit()..eitherFailureOrMoviesTopRated(),
        ),

        BlocProvider(
          create: (context) =>
              MoviesCubit()..eitherFailureOrMoviesUpcomingList(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        home: CelebritiesScreen(),
      ),
    );
  }
}
