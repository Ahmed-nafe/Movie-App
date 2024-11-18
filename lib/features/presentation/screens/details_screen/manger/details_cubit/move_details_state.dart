part of 'move_details_cubit.dart';

@immutable
sealed class MovieDetailsState {}

final class MovieDetailsInitial extends MovieDetailsState {}

final class MovieDetailsError extends MovieDetailsState {
  final String errorMessage;

  MovieDetailsError({required this.errorMessage});
}

final class MovieDetailsLoading extends MovieDetailsState {}

final class MovieDetailsSuccess extends MovieDetailsState {
  final MovieDetailsModel data;

  MovieDetailsSuccess({required this.data});
}
