import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/core/utils/server_locator.dart';
import 'package:movie/features/presentation/screens/browse_screen/views/genres_screen.dart';
import 'package:movie/features/presentation/screens/details_screen/data/repos/details_repo_impl.dart';
import 'package:movie/features/presentation/screens/details_screen/manger/details_cubit/move_details_cubit.dart';
import 'package:movie/features/presentation/screens/details_screen/views/film_details_view.dart';
import '../../features/presentation/home_view/view/home_screen.dart';
import '../../features/presentation/screens/splash_screen/splash_screen.dart';

abstract class AppRouter {
  static String homeView = "/homeView";
  static String detailsView = "/detailsView";
  static String genres = "/genresView";
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: homeView,
        builder: (BuildContext context, GoRouterState state) {
          return const Home();
        },
      ),
      GoRoute(
        path: detailsView,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
              create: (context) => MovieDetailsCubit(
                    getIt<DetailsRepoImpl>(),
                  ),
              child: FilmDetailsView(
                movieId: state.extra as int,
              ));
        },
      ),
      GoRoute(
        path: genres,
        builder: (BuildContext context, GoRouterState state) {
          final extraData = state.extra as Map<String, dynamic>?;
          final genreId = extraData?['genreId'] as int?;
          final genreName = extraData?['genreName'] as String?;
          return BlocProvider(
              create: (context) => MovieDetailsCubit(
                    getIt<DetailsRepoImpl>(),
                  ),
              child: GenreMoviesListScreen(
                title: genreName as String,
                genreId: genreId as int,
              ));
        },
      ),
    ],
  );
}
