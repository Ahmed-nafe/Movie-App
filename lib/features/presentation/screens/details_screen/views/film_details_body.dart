import 'package:flutter/material.dart';
import 'package:movie/core/utils/app_colors.dart';

import 'film_details.dart';

class FilmDetailsBody extends StatelessWidget {
  const FilmDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.shadeGray,
          foregroundColor: Colors.white,
          title: Text(
            "Dora and the lost city of gold",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.25,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/Image.png"), fit: BoxFit.cover),
              ),
            ),
            const FilmDetails(),
          ],
        ),
      ),
    );
  }
}
