part of 'category_genres_list_cubit.dart';

@immutable
sealed class CategoryGenresListState {}

final class CategoryGenresListInitial extends CategoryGenresListState {}

final class CategoryGenresListError extends CategoryGenresListState {
  final String error;

  CategoryGenresListError({required this.error});
}

final class CategoryGenresListLoading extends CategoryGenresListState {}

final class CategoryGenresListSuccess extends CategoryGenresListState {
  final CategoryGenresModel genres;

  CategoryGenresListSuccess({required this.genres});
}
