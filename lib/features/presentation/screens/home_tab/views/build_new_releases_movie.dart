import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/core/utils/cached_network_image.dart';
import 'package:movie/core/utils/shimmer_container.dart';
import '../../../../../core/utils/app_router.dart';
import '../data/model/NewReleaseModel.dart';

class BuildNewReleasesMovie extends StatelessWidget {
  const BuildNewReleasesMovie({
    super.key,
    required this.result,
  });

  final Results? result;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 13.7),
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              GoRouter.of(context)
                  .push(AppRouter.detailsView, extra: result?.id);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: BuildCachedNetworkImage(
                fit: BoxFit.fill,
                posterURL: result?.posterPath! ?? "",
                shimmerContainer: const ShimmerContainer(
                  width: 90,
                  height: 150,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
