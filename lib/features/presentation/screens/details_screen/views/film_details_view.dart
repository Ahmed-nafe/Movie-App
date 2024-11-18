import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/utils/server_locator.dart';
import 'package:movie/features/presentation/screens/details_screen/data/repos/details_repo_impl.dart';
import 'package:movie/features/presentation/screens/details_screen/manger/details_cubit/move_details_cubit.dart';
import 'package:movie/features/presentation/screens/details_screen/manger/more_like_cubit/more_like_cubit.dart';
import 'package:movie/features/presentation/screens/details_screen/views/film_details_body.dart';
import 'package:movie/features/presentation/screens/details_screen/data/model/MoveDetilsModel.dart';
import 'package:movie/features/presentation/screens/home_tab/data/model/NewReleaseModel.dart';

class FilmDetailsView extends StatefulWidget {
  FilmDetailsView({super.key, required this.movieId});

  int movieId;

  @override
  State<FilmDetailsView> createState() => _FilmDetailsViewState();
}

class _FilmDetailsViewState extends State<FilmDetailsView> {
  void initState() {
    super.initState();
    context
        .read<MovieDetailsCubit>()
        .fetchMovieDetails(movieId: widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoreLikeCubit(
        getIt.get<DetailsRepoImpl>(),
      )..fetchMoreLikeSection(widget.movieId),
      child: const FilmDetailsBody(),
    );
  }
}
