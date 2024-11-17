import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/core/utils/app_router.dart';
import 'package:movie/features/presentation/screens/home_tab/data/model/PouplarModel.dart';

class FilmItem extends StatelessWidget {
  FilmItem({
    super.key,
    required this.results,
  });

  Results? results;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            GoRouter.of(context).push(AppRouter.detailsView);
          },
          child: Container(
              height: MediaQuery.sizeOf(context).height * 0.22,
              width: MediaQuery.sizeOf(context).width * 0.34,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: CachedNetworkImage(
                  imageUrl:
                      "https://image.tmdb.org/t/p/original/${results?.posterPath ?? ""}")),
        ),
        const SizedBox(width: 7),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(
              top: MediaQuery.sizeOf(context).height * 0.12,
              left: MediaQuery.sizeOf(context).height * 0.01,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  results?.originalTitle ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  results?.releaseDate ?? "",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
