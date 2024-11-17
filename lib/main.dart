import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/utils/server_locator.dart';
import 'package:movie/features/presentation/screens/home_tab/data/repos/home_repo_impl.dart';
import 'package:movie/features/presentation/screens/home_tab/manger/new_releses_cubit/new_releases_cubit.dart';
import 'package:movie/features/presentation/screens/home_tab/manger/recommended_cubit/recommended_cubit.dart';
import 'core/utils/app_router.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewReleasesCubit(
            getIt.get<HomeRepoImplement>(),
          )..fetchNewReleases(),
        ),
        BlocProvider(
          create: (context) => RecommendedCubit(
            getIt.get<HomeRepoImplement>(),
          )..fetchRecommended(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
