import 'package:flutter/material.dart';
import '../data/model/search_model.dart';
import 'build_search_result.dart';

class BuildListSearchResult extends StatelessWidget {
  const BuildListSearchResult({
    super.key,
    required this.result,
  });

  final SearchModel result;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: result.results?.length,
            itemBuilder: (context, index) {
              final resultData = result.results?[index];
              return BuildSearchResult(
                resultData: resultData,
              );
            },
          ),
        ),
      ],
    );
  }
}
