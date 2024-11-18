import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/utils/server_locator.dart';
import 'package:movie/features/presentation/screens/browse_screen/data/repo/category_repo_implment.dart';
import 'package:movie/features/presentation/screens/browse_screen/manger/category_list_cubit/category_list_cubit.dart';
import 'browse_body.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryListCubit(
        getIt.get<CategoryRepoImpl>(),
      )..fetchCategoryList(),
      child: const BrowseBody(),
    );
  }
}
