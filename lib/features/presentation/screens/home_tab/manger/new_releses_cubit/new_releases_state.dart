part of 'new_releases_cubit.dart';

@immutable
sealed class NewReleasesState {}

final class NewReleasesInitial extends NewReleasesState {}

final class NewReleasesError extends NewReleasesState {
  String errorMessage;

  NewReleasesError(this.errorMessage);
}

final class NewReleasesLoading extends NewReleasesState {}

final class NewReleasesSuccess extends NewReleasesState {
  final NewReleaseModel newReleaseModel;

  NewReleasesSuccess(this.newReleaseModel);
}
