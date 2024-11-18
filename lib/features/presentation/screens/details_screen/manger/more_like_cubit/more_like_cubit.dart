import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie/features/presentation/screens/details_screen/data/model/MoreLikeModel.dart';
import 'package:movie/features/presentation/screens/details_screen/data/repos/details_repo.dart';

part 'more_like_state.dart';

class MoreLikeCubit extends Cubit<MoreLikeState> {
  MoreLikeCubit(this.detailsRepo) : super(MoreLikeInitial());
  DetailsRepo detailsRepo;

  Future<void> fetchMoreLikeSection(int movieId) async {
    emit(MoreLikeLoading());
    try {
      final result = await detailsRepo.fetchMoreLikeMovie(movieId: movieId);
      result.fold(
        (error) => emit(MoreLikeError(error.errorMessage)),
        (movie) => emit(MoreLikeSuccess(movie)),
      );
    } catch (e) {
      emit(MoreLikeError(e.toString()));
    }
  }
}
