import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/utils/app_colors.dart';
import 'package:movie/features/presentation/screens/watchlist_screen/manger/movie_watch_list_cubit.dart';
import 'package:movie/features/presentation/screens/watchlist_screen/views/watch_list_body.dart';

class WatchList extends StatelessWidget {
  const WatchList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: BlocProvider(
        create: (context) => MovieWatchListCubit(),
        child: WatchListBody(),
      ),
    );
  }
}
