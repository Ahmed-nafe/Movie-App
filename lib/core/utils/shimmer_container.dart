import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({super.key,required this.width,required this.height});

  final double width ;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey,
      child: Container(
        width: width,
        height: height,
        color: Colors.white,
      ),
    );
  }
}
