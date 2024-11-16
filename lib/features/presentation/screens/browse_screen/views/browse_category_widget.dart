import 'package:flutter/material.dart';

class BrowseCategorySection extends StatelessWidget {
  const BrowseCategorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 29),
        child: GridView.builder(
          itemCount: 15,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 20,
            mainAxisSpacing: 40,
            crossAxisCount: 2,
            mainAxisExtent: 120,
          ),
          itemBuilder: (context, index) {
            return Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  fit: BoxFit.fill,
                  image:
                      AssetImage("assets/0e34a5e080e8c915030603ddcdb4eeba.png"),
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                child: Text(
                  'Action',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
