import 'package:flutter/material.dart';
import 'package:movie/features/presentation/screens/home_tab/views/recommend_list_view.dart';
import '../../../../../core/utils/app_colors.dart';

class RecommendSection extends StatelessWidget {
  const RecommendSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.38,
      width: double.infinity,
      margin: EdgeInsets.only(
        bottom: MediaQuery.sizeOf(context).height * 0.01,
      ),
      decoration: const BoxDecoration(
        color: AppColors.shadeGray,
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 19.0, top: 14, bottom: 7),
            child: Text(
              "Recommended",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          RecommendListView(),
        ],
      ),
    );
  }
}
