import 'package:flutter/material.dart';
import 'package:movie/features/presentation/tabs/search_tab/views/search_tab_body.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SearchTabBody(),
      ),
    );
  }
}

