import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/utils/cached_network_image.dart';
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
          return const ShimmerContainer(width: double.infinity, height: 300);
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
                    child: BuildCachedNetworkImage(
                      posterURL: result?.backdropPath ?? "",
                      shimmerContainer:
                          const ShimmerContainer(width: 150, height: 100),
                      fit: BoxFit.scaleDown,
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
              autoPlay: false,
              viewportFraction: 1,
              autoPlayCurve: Curves.easeInOut,
              autoPlayInterval: const Duration(seconds: 10),
              autoPlayAnimationDuration: const Duration(seconds: 1),
            ),
          );
        }
        if (state is PopularError) {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.4,
            child: Center(
                child: Text(
              'Error fetching data ${state.errorMessage}',
              style: const TextStyle(color: Colors.white, fontSize: 18),
            )),
          );
        } else {
          return const Center(child: Text("OOPS!"));
        }
      },
    );
  }
}
