import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:movie/features/presentation/screens/home_tab/data/model/RecommendedModel.dart';

part 'movie_watch_list_state.dart';

class MovieWatchListCubit extends Cubit<MovieWatchListState> {
  MovieWatchListCubit() : super(MovieWatchListInitial()) {
    _loadMoviesFromBox();
  }

  List<Results> movieList = [];
  final movieBox = Hive.box("movie");

  void _loadMoviesFromBox() {
    final data = movieBox.values.toList();
    movieList = data.map((movie) {
      return Results(
          id: movie["id"],
          title: movie["title"],
          backdropPath: movie["image"],
          releaseDate: movie["date"],
          originalTitle: movie["originalTitle"]);
    }).toList();
    emit(MovieWatchListSucceed(movieList));
  }

  void addTodoItemsToList(Results value) {
    if (!movieList.any((movie) => movie.id == value.id)) {
      movieBox.add({
        "title": value.title,
        "id": value.id,
        "image": value.backdropPath,
        "date": value.releaseDate,
        "originalTitle": value.originalTitle
      });

      movieList.add(value);
      emit(MovieWatchListSucceed(movieList));
    } else {
      emit(MovieWatchListError("This movie is already in your Watch List."));
    }
  }

  void removeTodoItemsToList(int movieId) {
    final index =
        movieBox.values.toList().indexWhere((movie) => movie["id"] == movieId);
    if (index != -1) {
      movieBox.deleteAt(index);
      movieList.removeWhere((movie) => movie.id == movieId);
      emit(MovieWatchListSucceed(movieList));
    } else {
      emit(MovieWatchListError("Failed to remove the movie: Movie not found."));
    }
  }
}
