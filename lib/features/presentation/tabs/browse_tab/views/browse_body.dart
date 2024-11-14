import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/utils/app_colors.dart';
import 'browse_category_section.dart';

class BrowseBody extends StatelessWidget {
  const BrowseBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 21, bottom: 15),
              child: Text(
                "Browse Category",
                style: GoogleFonts.elMessiri(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const BrowseCategorySection(),
          ],
        ),
      ),
    );
  }
}
