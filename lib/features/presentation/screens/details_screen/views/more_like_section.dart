import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import 'more_like_list_view.dart';

class MoreLikeSection extends StatelessWidget {
  const MoreLikeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 25),
      decoration: const BoxDecoration(
        color: AppColors.shadeGray,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 19.0, top: 14, bottom: 7),
            child: Text(
              "More Like This",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.21,
              child: const Expanded(
                child: MoreLikeListView(),
              ))
        ],
      ),
    );
  }
}
