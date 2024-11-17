part of 'popular_cubit.dart';

@immutable
sealed class PopularState {}

final class PopularInitial extends PopularState {}

final class PopularError extends PopularState {
  String errorMessage;

  PopularError({required this.errorMessage});
}

final class PopularLoading extends PopularState {}

final class PopularSuccess extends PopularState {
  PopularModel popularModel;

  PopularSuccess({required this.popularModel});
}
