import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BuildShimmer extends StatelessWidget {
   BuildShimmer({super.key, required this.height, required this.width});

  double height;
  double width;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 6),
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.grey,
            child: Container(
              margin: const EdgeInsets.only(left: 16),
              width: width,
              height: height,
              color: Colors.white,
            ),
          );
        },
        itemCount: 5, // Show 5 shimmer items
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
