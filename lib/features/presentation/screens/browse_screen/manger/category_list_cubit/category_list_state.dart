part of 'category_list_cubit.dart';

@immutable
sealed class CategoryListState {}

final class CategoryListInitial extends CategoryListState {}

final class CategoryListError extends CategoryListState {
  final String errorMessage;

  CategoryListError({required this.errorMessage});
}

final class CategoryListLoading extends CategoryListState {}

final class CategoryListSuccess extends CategoryListState {
  final CategoryListModel categories;

  CategoryListSuccess({required this.categories});
}
