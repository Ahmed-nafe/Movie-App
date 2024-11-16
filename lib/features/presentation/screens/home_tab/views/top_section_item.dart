import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'film_item.dart';

class TopSectionItem extends StatelessWidget {
  const TopSectionItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 5,
      itemBuilder: (context, index, pageViewIndex) {
        return Stack(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.28,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/Image.png'),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.sizeOf(context).height * 0.15,
                left: MediaQuery.sizeOf(context).height * 0.014,
              ),
              child: const FilmItem(),
            ),
          ],
        );
      },
      options: CarouselOptions(
        height: MediaQuery.sizeOf(context).height * .36,
        autoPlay: false,
        viewportFraction: 1,
        autoPlayCurve: Curves.fastOutSlowIn,
        // autoPlayAnimationDuration: const Duration(seconds: 2),
      ),
    );
  }
}
