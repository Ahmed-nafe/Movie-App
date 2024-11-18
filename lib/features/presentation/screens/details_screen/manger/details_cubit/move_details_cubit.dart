import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:movie/features/presentation/screens/details_screen/data/model/MoveDetilsModel.dart';
import 'package:movie/features/presentation/screens/details_screen/data/repos/details_repo.dart';
import 'package:movie/features/presentation/screens/home_tab/data/repos/home_repo.dart';

part 'move_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit(this.detailsRepo) : super(MovieDetailsInitial());
  DetailsRepo detailsRepo;

  Future<void> fetchMovieDetails({required int movieId}) async {
    emit(MovieDetailsLoading());
    try {
      var movie = await detailsRepo.fetchDetailsMovie(movieId: movieId);
      movie.fold(
          (failure) =>
              emit(MovieDetailsError(errorMessage: failure.errorMessage)),
          (movie) => emit(MovieDetailsSuccess(data: movie)));
    } catch (e) {
      emit(MovieDetailsError(errorMessage: e.toString()));
    }
  }
}
