import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/utils/app_colors.dart';
import 'new_releases_lit_view.dart';

class NewReleasesSection extends StatelessWidget {
  const NewReleasesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.22,
      decoration: const BoxDecoration(
        color: AppColors.shadeGray,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 19.0, top: 14),
            child: Text(
              "New Releases",
              style: GoogleFonts.montserrat(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const NewReleasesListView(),
        ],
      ),
    );
  }
}