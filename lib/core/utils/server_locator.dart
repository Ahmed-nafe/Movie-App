import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie/features/presentation/screens/details_screen/data/repos/details_repo_impl.dart';
import 'package:movie/features/presentation/screens/home_tab/data/repos/home_repo_impl.dart';
import 'api_manger.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiManger>(ApiManger(Dio()));
  getIt.registerSingleton<HomeRepoImplement>(
    HomeRepoImplement(
      getIt.get<ApiManger>(),
    ),
  );
  getIt.registerSingleton<DetailsRepoImpl>(
    DetailsRepoImpl(
      getIt.get<ApiManger>(),
    ),
  );
  // getIt.registerSingleton<SearchRepoImpl>(
  //   SearchRepoImpl(
  //     getIt.get<ApiManger>(),
  //   ),
  // );
}
