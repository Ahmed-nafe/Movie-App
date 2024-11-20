import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie/features/presentation/screens/search_screen/data/model/search_model.dart';
import 'package:movie/features/presentation/screens/search_screen/data/repos/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  static SearchCubit get(context) => BlocProvider.of(context);

  SearchCubit(this.searchRepo) : super(SearchInitial());
  SearchRepo searchRepo;
  TextEditingController searchController = TextEditingController();

  Future<void> fetchSearchData({required String query}) async {
    emit(SearchLoading());
    try {
      var searchData = await searchRepo.fetchSearch(query: query);
      searchData.fold(
        (failure) => emit(
          SearchError(errorMessage: failure.errorMessage),
        ),
        (data) => emit(SearchSuccess(searchModel: data)),
      );
    } catch (e) {
      emit(
        SearchError(errorMessage: e.toString()),
      );
    }
  }

//
// class SearchCubit extends Cubit<SearchState> {
// SearchCubit(): super(InitalSearchState());
// static SearchCubit get(context) => BlocProvider.of(context);
//
// TextEditingController searchController = TextEditingController();
// String searchQuery = '';
//
// List<SearchedMovie> searchList = [];
//
//
// void clearSearch() {
// searchQuery = '';
// searchController.clear();
// emit(InitalSearchState());
// }

// Future<void> getSearchList({required String searchQuery}) async {
// emit(GetSearchMoviesLoading());
//
// bool isConnected = await InternetConnectionChecker().hasConnection;
// if (!isConnected) {
// emit(GetSearchMoviesError());
// }
//
// try {
// SearchedMovieModel movies = await SearchApi.getSearchMovies(searchQuery: searchQuery);
// searchList = movies.results ?? [];
//
// if (searchList.isEmpty) {
// emit(GetSearchMoviesNotFoundState());
// } else {
// for(var movie in searchList) {
// log(movie.title.toString());
// }
// emit(GetSearchMoviesSuccses());
// }
// } catch (e) {
// failureNotifcation();
// emit(GetSearchMoviesError());
// }
// }
//
// }
}
