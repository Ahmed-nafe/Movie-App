import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/model/NewReleaseModel.dart';
import '../../data/repos/home_repo.dart';

part 'new_releases_state.dart';

class NewReleasesCubit extends Cubit<NewReleasesState> {
  NewReleasesCubit(this.homeRepo) : super(NewReleasesInitial());
  final HomeRepo homeRepo;

  Future<void> fetchNewReleases() async {
    emit(NewReleasesLoading());

    try {
      var result = await homeRepo.fetchNewReleases();
      result.fold(
        (failure) => {emit(NewReleasesError(failure.errorMessage))},
        (movie) => {
          emit(
            NewReleasesSuccess(movie)),
        },
      );
    } catch (e) {
      emit(NewReleasesError(e.toString()));
    }
  }
}
