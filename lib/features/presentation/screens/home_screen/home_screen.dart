import 'package:flutter/material.dart';

import 'package:movie/features/presentation/Screens/home_screen/home_body.dart';


class Home extends StatelessWidget {
  static const String routeName = 'home';

  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeBody();
  }
}
