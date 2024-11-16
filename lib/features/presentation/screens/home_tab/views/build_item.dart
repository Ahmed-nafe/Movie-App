import 'package:flutter/material.dart';

import 'film_item.dart';

class BuildItem extends StatelessWidget {
  const BuildItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
  }
}
