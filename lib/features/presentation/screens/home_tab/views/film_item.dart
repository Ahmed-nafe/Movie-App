import 'package:flutter/material.dart';

class FilmItem extends StatelessWidget {
  const FilmItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height * 0.22,
          width: MediaQuery.sizeOf(context).width * 0.34,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/Image.png'),
            ),
          ),
        ),
        const SizedBox(width: 7),
        Container(
          padding: EdgeInsets.only(
            top: MediaQuery.sizeOf(context).height * 0.12,
            left: MediaQuery.sizeOf(context).height * 0.01,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                "Dora and the lost city of gold",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                "2019  PG-13  2h 7m",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
