part of 'recommended_cubit.dart';

@immutable
sealed class RecommendedState {}

final class RecommendedInitial extends RecommendedState {}

final class RecommendedError extends RecommendedState {
  String errorMessage;

  RecommendedError({required this.errorMessage});
}

final class RecommendedLoading extends RecommendedState {}

final class RecommendedSuccess extends RecommendedState {
  RecommendedModel recommendedModel;

  RecommendedSuccess(this.recommendedModel);
}
