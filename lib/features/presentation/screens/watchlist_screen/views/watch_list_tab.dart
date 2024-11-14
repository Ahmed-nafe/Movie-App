import 'package:flutter/material.dart';
import 'package:movie/core/utils/app_colors.dart';
import 'package:movie/features/presentation/screens/watchlist_screen/views/watch_list_body.dart';

class WatchList extends StatelessWidget {
  const WatchList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: WatchListBody(),
    );
  }
}
