



import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../utils/my_text_styles.dart';

 

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar(
      {super.key,
      required this.size,
      required this.searchController,
      required this.searchFunction,
      required this.hintText      
      });

  final Size size;
  final TextEditingController searchController;
  final Function() searchFunction;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.047 , vertical: verticalMargin),
      child: Container(
        padding: EdgeInsets.all(size.width * 0.02),
        decoration: BoxDecoration(
            color: kSoftPink,
            borderRadius: BorderRadius.circular(curvInHomeView)),
        child: TextField(
          controller: searchController,
          cursorColor: kprimecolor,
          decoration: InputDecoration(
              border: InputBorder.none, // Removes any border
              focusedBorder: InputBorder.none, // Removes border on focus
              enabledBorder: InputBorder.none,
              prefixIcon: IconButton(
                onPressed: searchFunction,
                icon: const Icon(Icons.search),
              ),
              //border: InputBorder.none,
              hintText: hintText ,
              hintStyle:
                  const TextStyle(fontWeight: MyTextStyles.thinTextWeight)),
        ),
      ),
    );
  }
}