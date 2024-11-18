part of 'more_like_cubit.dart';

@immutable
sealed class MoreLikeState {}

final class MoreLikeInitial extends MoreLikeState {}

final class MoreLikeError extends MoreLikeState {
  final String errorMessage;

  MoreLikeError(this.errorMessage);
}

final class MoreLikeLoading extends MoreLikeState {}

final class MoreLikeSuccess extends MoreLikeState {
  final MoreLikeModel moreLikeModel;

  MoreLikeSuccess(this.moreLikeModel);
}
