import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/utils/shimmer_container.dart';
import 'package:movie/features/presentation/screens/home_tab/data/model/PouplarModel.dart';
import 'package:movie/features/presentation/screens/home_tab/manger/popular_cuibt/popular_cubit.dart';
import 'film_item.dart';

class TopSectionItem extends StatelessWidget {
  const TopSectionItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularCubit, PopularState>(
      builder: (context, state) {
        if (state is PopularLoading) {
          return const Expanded(
            child: ShimmerContainer(width: double.infinity, height: 200),
          );
        }
        if (state is PopularSuccess) {
          PopularModel popularModel = state.popularModel;
          return CarouselSlider.builder(
            itemCount: popularModel.results?.length,
            itemBuilder: (context, index, pageViewIndex) {
              final result = popularModel.results?[index];
              return Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.28,
                    width: double.infinity,
                    child: CachedNetworkImage(
                      fit: BoxFit.scaleDown,
                      imageUrl:
                          "https://image.tmdb.org/t/p/original/${result?.backdropPath ?? ""}",
                      placeholder: (context, url) => const ShimmerContainer(
                        width: 100,
                        height: 150,
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
                  Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.sizeOf(context).height * 0.15,
                      left: MediaQuery.sizeOf(context).height * 0.014,
                    ),
                    child: FilmItem(
                      results: result,
                    ),
                  ),
                ],
              );
            },
            options: CarouselOptions(
              height: MediaQuery.sizeOf(context).height * .36,
              autoPlay: true,
              viewportFraction: 1,
              autoPlayCurve: Curves.easeInOut,
              autoPlayInterval: const Duration(seconds: 10),
              autoPlayAnimationDuration: const Duration(seconds: 1),
            ),
          );
        }
        if (state is PopularError) {
          return Text('Error fetching data ${state.errorMessage}');
        } else {
          return const Center(child: Text("OOPS!"));
        }
      },
    );
  }
}
