import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie/features/presentation/screens/home_tab/data/model/PouplarModel.dart';
import 'package:movie/features/presentation/screens/home_tab/data/repos/home_repo.dart';

part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  PopularCubit(this.homeRepo) : super(PopularInitial());
  HomeRepo homeRepo;

  Future<void> fetchPopularMovies() async {
    emit(PopularLoading());
    try {
      final popularMovies = await homeRepo.fetchPopular();
      popularMovies.fold(
        (failure) => emit(
          PopularError(errorMessage: failure.errorMessage),
        ),
        (movie) => emit(PopularSuccess(popularModel: movie)),
      );
    } catch (e) {
      emit(PopularError(errorMessage: e.toString()));
    }
  }
}
