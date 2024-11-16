import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import 'browse_category_widget.dart';

class BrowseBody extends StatelessWidget {
  const BrowseBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20, left: 21, bottom: 15),
              child: Text(
                "Browse Category",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            BrowseCategorySection(),
          ],
        ),
      ),
    );
  }
}
