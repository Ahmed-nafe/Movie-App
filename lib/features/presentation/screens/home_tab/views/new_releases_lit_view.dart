import 'package:flutter/material.dart';

class NewReleasesListView extends StatelessWidget {
  const NewReleasesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 12, left: 19, bottom: 14),
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 13.7),
            child: Image.asset(
              "assets/f8b938401308eabc48c30669869eeac8.png",
              fit: BoxFit.fill,
            ),
          );
        },
      ),
    );
  }
}
