import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie/features/presentation/screens/browse_screen/data/model/category_genres_model.dart';
import 'package:movie/features/presentation/screens/browse_screen/data/repo/category_repo.dart';

part 'category_genres_list_state.dart';

class CategoryGenresListCubit extends Cubit<CategoryGenresListState> {
  CategoryGenresListCubit(this.categoryRepo)
      : super(CategoryGenresListInitial());
  CategoryRepo categoryRepo;

  Future<void> fetchCategoryGenresList({required int genreID}) async {
    emit(CategoryGenresListLoading());
    try {
      var result = await categoryRepo.fetchGenresID(movieId: genreID);
      result.fold(
        (failure) => emit(CategoryGenresListError(error: failure.errorMessage)),
        (category) => emit(CategoryGenresListSuccess(genres: category)),
      );
    } catch (e) {
      emit(
        CategoryGenresListError(error: e.toString()),
      );
    }
  }
}
