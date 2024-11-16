import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/core/utils/app_router.dart';

class NewReleasesListView extends StatelessWidget {
  const NewReleasesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 12, left: 19, bottom: 14),
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 13.7),
            child: Stack(
              children: [
                InkWell(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.detailsView);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      height: MediaQuery.sizeOf(context).height * 0.2,
                      width: MediaQuery.sizeOf(context).width * 0.25,
                      "assets/f8b938401308eabc48c30669869eeac8.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 32,
                      width: 24,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/Icons/bookmark.png"),
                        ),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
