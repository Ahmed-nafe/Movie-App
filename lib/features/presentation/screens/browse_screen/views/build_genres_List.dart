import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/shimmer_container.dart';
import '../data/model/category_genres_model.dart';

class BuildGenresList extends StatelessWidget {
  const BuildGenresList({
    super.key,
    required this.categoryGenresModel,
  });

  final CategoryGenresModel categoryGenresModel;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.sizeOf(context).height * 0.0006,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: categoryGenresModel.results?.length,
      itemBuilder: (context, index) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.all(15),
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  GoRouter.of(context).push(AppRouter.detailsView,
                      extra: categoryGenresModel.results?[index].id);
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailsPage(movie: movie),));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl:
                        "https://image.tmdb.org/t/p/original/${categoryGenresModel.results?[index].posterPath},",
                    placeholder: (context, url) => const ShimmerContainer(
                      width: double.infinity,
                      height: 300,
                    ),
                    errorWidget: (context, url, error) => const SizedBox(
                      height: 100,
                      width: 150,
                      child: Center(
                        child: Icon(
                          Icons.error_outline,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              textAlign: TextAlign.center,
              (categoryGenresModel.results?[index].title ?? "").length > 20
                  ? (categoryGenresModel.results?[index].title ?? "")
                      .substring(0, 20)
                  : categoryGenresModel.results?[index].title ?? "",
              maxLines: 1,
              style: const TextStyle(
                color: Colors.grey,
                overflow: TextOverflow.ellipsis,
                fontSize: 18,
              ),
            ),
          ],
        );
      },
    );
  }
}
