import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie/features/presentation/screens/browse_screen/data/model/category_list_model.dart';
import 'package:movie/features/presentation/screens/browse_screen/data/repo/category_repo.dart';

part 'category_list_state.dart';

class CategoryListCubit extends Cubit<CategoryListState> {
  CategoryListCubit(this.categoryRepo) : super(CategoryListInitial());
  CategoryRepo categoryRepo;

  Future<void> fetchCategoryList() async {
    emit(CategoryListLoading());
    try {
      var categoryList = await categoryRepo.fetchCategoryGenresList();
      categoryList.fold(
        (failure) => emit(
          CategoryListError(errorMessage: failure.errorMessage),
        ),
        (category) => emit(
          CategoryListSuccess(categories: category),
        ),
      );
    } catch (e) {
      emit(
        CategoryListError(errorMessage: e.toString()),
      );
    }
  }


}
