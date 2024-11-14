import 'package:flutter/material.dart';
import 'package:movie/features/presentation/tabs/home_tab/views/home_tab_body.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: HomeTabBody(),
    );
  }
}
