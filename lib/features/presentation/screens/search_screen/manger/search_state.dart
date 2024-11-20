part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchError extends SearchState {
  final String errorMessage;

  SearchError({required this.errorMessage});
}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final SearchModel searchModel;

  SearchSuccess({required this.searchModel});
}
