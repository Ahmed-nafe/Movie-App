import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manger/search_cubit.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.all(height * 0.02),
      child: TextField(
        controller: context.read<SearchCubit>().searchController,
        onChanged: (query) {
          if (query.isNotEmpty) {
            context.read<SearchCubit>().fetchSearchData(query: query);
          }
        },
        cursorColor: Colors.white,
        cursorHeight: 20,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        textInputAction: TextInputAction.go,
        decoration: InputDecoration(
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
          labelText: "Search",
          labelStyle: const TextStyle(
            color: Colors.white,
          ),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 1.5),
      borderRadius: BorderRadius.circular(15),
    );
  }
}
