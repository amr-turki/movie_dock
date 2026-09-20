import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_dock_application/features/celebrities/presentation/cubit/celebritiedetails/celebritie_details_cubit.dart';
import 'package:movie_dock_application/features/celebrities/presentation/cubit/combinedcredits/combined_credits_cubit.dart';
import 'package:movie_dock_application/features/celebrities/presentation/cubit/popular/popular_celebrities_cubit.dart';
import 'package:movie_dock_application/features/celebrities/presentation/cubit/trending/trending_celebrities_cubit.dart';
import 'package:movie_dock_application/features/celebrities/presentation/screens/celebrities_screen.dart';
import 'package:movie_dock_application/features/movies/presentation/cubit/movie_cast/movie_credit_cubit.dart';
import 'package:movie_dock_application/features/movies/presentation/cubit/movie_details/movie_details_cubit.dart';
import 'package:movie_dock_application/features/movies/presentation/cubit/movie_feed/movies_cubit.dart';
import 'package:movie_dock_application/features/movies/presentation/cubit/movie_recommendation/movie_recommendation_cubit.dart';
import 'package:movie_dock_application/features/series/presentation/cubit/serie_detail/series_cubit.dart';
import 'package:movie_dock_application/features/series/presentation/cubit/series_credit/serie_credit_cubit.dart';
import 'package:movie_dock_application/features/series/presentation/cubit/series_feed/series_cubit.dart';
import 'package:movie_dock_application/features/series/presentation/cubit/series_recommendation/series_cubit.dart';

void main() {
  runApp(MovieDockApplication());
}

class MovieDockApplication extends StatelessWidget {
  const MovieDockApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PopularCelebritiesCubit()),
        BlocProvider(create: (context) => TrendingCelebritiesCubit()),
        BlocProvider(create: (context) => CombinedCreditsCubit()),
        BlocProvider(create: (context) => CelebritieDetailsCubit()),
        BlocProvider(create: (context) => MoviesCubit()),
        BlocProvider(create: (context) => SeriesCubit()),
        BlocProvider(create: (context) => SerieDetailsCubit()),

        BlocProvider(create: (context) => SerieCreditCubit()),

        BlocProvider(create: (context) => SeriesRecommendationCubit()),

        BlocProvider(create: (context) => MovieRecommendationCubit()),

        BlocProvider(create: (context) => MovieCreditCubit()),

        BlocProvider(create: (context) => MovieDetailsCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        home: CelebritiesScreen(),
      ),
    );
  }
}
