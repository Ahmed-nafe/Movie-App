import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../core/utils/app_router.dart';
import '../data/model/NewReleaseModel.dart';

class BuildNewReleasesMovie extends StatelessWidget {
  const BuildNewReleasesMovie({
    super.key,
    required this.bosterResult,
  });

  final Results? bosterResult;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 13.7),
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              GoRouter.of(context).push(AppRouter.detailsView);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl:
                    "https://image.tmdb.org/t/p/original/${bosterResult?.posterPath! ?? ""},",
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.grey,
                  child: Container(
                    width: 100,
                    height: 150,
                    color: Colors.white,
                  ),
                ),
                errorWidget: (context, url, error) => const SizedBox(
                  height: 100,
                  width: 150,
                  child: Center(
                    child: Icon(Icons.error),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 32,
                width: 24,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/Icons/bookmark.png"),
                  ),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
