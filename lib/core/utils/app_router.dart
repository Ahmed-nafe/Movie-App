import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/features/presentation/screens/details_screen/views/film_details_view.dart';
import '../../features/presentation/home_view/view/home_screen.dart';
import '../../features/presentation/screens/splash_screen/splash_screen.dart';

abstract class AppRouter {
  static String homeView = "/homeView";
  static String detailsView = "/detailsView";

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
          return const FilmDetailsView();
        },
      ),
    ],
  );
}
