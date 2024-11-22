part of 'movie_watch_list_cubit.dart';

@immutable
sealed class MovieWatchListState {}

final class MovieWatchListInitial extends MovieWatchListState {}

final class MovieWatchListSucceed extends MovieWatchListState {
  final List<Results> watchList;

  MovieWatchListSucceed(this.watchList);
}

final class MovieWatchListError extends MovieWatchListState {
  final String errorMessage;

  MovieWatchListError(this.errorMessage);
}
