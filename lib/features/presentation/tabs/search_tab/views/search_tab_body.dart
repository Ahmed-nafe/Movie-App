import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/assets_app.dart';
import 'custom_text_field.dart';

class SearchTabBody extends StatelessWidget {
  const SearchTabBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextField(),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SvgPicture.asset(AssetsApp.searchNotFound),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "No movies found",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
