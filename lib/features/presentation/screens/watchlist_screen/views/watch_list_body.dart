import 'package:flutter/material.dart';
import 'package:movie/features/presentation/screens/watchlist_screen/views/watch_list_widget.dart';

class WatchListBody extends StatelessWidget {
  const WatchListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 16.0,
          top: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Watchlist",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            WatchListWidget(),
          ],
        ),
      ),
    );
  }
}
