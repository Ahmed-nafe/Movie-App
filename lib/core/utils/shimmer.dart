import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BuildShimmer extends StatelessWidget {
  const BuildShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.grey,
            child: Container(
              margin: const EdgeInsets.only(left: 16),
              width: 100,
              height:60,
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
