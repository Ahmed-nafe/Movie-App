import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/utils/app_colors.dart';
import 'package:movie/features/presentation/screens/details_screen/manger/details_cubit/move_details_cubit.dart';
import 'package:movie/features/presentation/screens/details_screen/data/model/MoveDetilsModel.dart';
import '../../../../../core/utils/shimmer_container.dart';
import 'film_details.dart';

class FilmDetailsBody extends StatelessWidget {
  const FilmDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
          if (state is MovieDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is MovieDetailsSuccess) {
            MovieDetailsModel movieDetailsModel = state.data;
            return Scaffold(
              backgroundColor: AppColors.backgroundColor,
              appBar: AppBar(
                backgroundColor: AppColors.shadeGray,
                foregroundColor: Colors.white,
                title: Text(
                  movieDetailsModel.title ?? "",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.25,
                    width: double.infinity,
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl:
                          "https://image.tmdb.org/t/p/original/${movieDetailsModel.backdropPath}",
                      placeholder: (context, url) => const ShimmerContainer(
                        width: double.infinity,
                        height: 150,
                      ),
                      errorWidget: (context, url, error) =>
                          const Center(child: Icon(Icons.error)),
                    ),
                  ),
                  FilmDetails(
                    movieDetailsModel: movieDetailsModel,
                  ),
                ],
              ),
            );
          }
          if (state is MovieDetailsError) {
            return Center(
              child: Text("Error :${state.errorMessage}"),
            );
          }
          else {
            return const Text("Error: Unknown state");
          }
        },
      ),
    );
  }
}
