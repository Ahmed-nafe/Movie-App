import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/utils/shimmer_container.dart';

class BuildCachedNetworkImage extends StatelessWidget {
  BuildCachedNetworkImage({
    super.key,
    required this.posterURL,
    required this.shimmerContainer,
    required this.fit,
  });

  String posterURL;
  ShimmerContainer shimmerContainer;
  BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit,
      imageUrl: "https://image.tmdb.org/t/p/original/${posterURL},",
      placeholder: (context, url) => shimmerContainer,
      errorWidget: (context, url, error) => const SizedBox(
        height: 100,
        width: 150,
        child: Center(
          child: Icon(
            Icons.error,
            color: Colors.white,
            size: 35,
          ),
        ),
      ),
    );
  }
}
