import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../../features/presentation/screens/home_screen/view/home_screen.dart';
import '../../features/presentation/screens/splash_screen/splash_screen.dart';

abstract class AppRouter {
  static String homeView = "/homeView";
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
    ],
  );
}
