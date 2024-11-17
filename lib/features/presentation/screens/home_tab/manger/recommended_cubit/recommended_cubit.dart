import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie/features/presentation/screens/home_tab/data/model/RecommendedModel.dart';
import 'package:movie/features/presentation/screens/home_tab/data/repos/home_repo.dart';

part 'recommended_state.dart';

class RecommendedCubit extends Cubit<RecommendedState> {
  RecommendedCubit(this.homeRepo) : super(RecommendedInitial());

  HomeRepo homeRepo;

  Future<void> fetchRecommended() async {
    emit(RecommendedLoading());

    try {
      var result = await homeRepo.fetchRecommended();
      result.fold(
        (failure) => {
          emit(RecommendedError(errorMessage: failure.errorMessage)),
        },
        (movie) => {
          emit(RecommendedSuccess(movie)),
        },
      );
    } catch (e) {
      emit(
        RecommendedError(errorMessage: e.toString()),
      );
    }
  }
}
