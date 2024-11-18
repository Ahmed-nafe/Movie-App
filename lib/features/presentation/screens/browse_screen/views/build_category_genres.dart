import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../data/model/category_list_model.dart';
class BuildCategoryGenres extends StatelessWidget {
  const BuildCategoryGenres({
    super.key,
    required this.genres,
  });

  final Genres? genres;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent.withOpacity(0),
      splashColor: Colors.transparent,
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.kPrimaryColor,
                    AppColors.kPrimaryColor.shade900
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
            Text(
              genres?.name ?? 'Unknown',
              textAlign: TextAlign.justify,
              maxLines: 1,
              style: const TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
