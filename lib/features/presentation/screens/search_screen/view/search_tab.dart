import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/utils/server_locator.dart';
import 'package:movie/features/presentation/screens/search_screen/data/repos/search_repo_impl.dart';
import 'package:movie/features/presentation/screens/search_screen/manger/search_cubit.dart';
import 'package:movie/features/presentation/screens/search_screen/view/search_tab_body.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocProvider(
          create: (context) => SearchCubit(getIt.get<SearchRepoImpl>()),
          child: const SearchTabBody(),
        ),
      ),
    );
  }
}
