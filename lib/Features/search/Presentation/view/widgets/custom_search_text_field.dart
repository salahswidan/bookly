import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade200,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade200,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          prefixIcon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
            size: 22,
            color: Colors.grey,
          ),
          hintText: "Search",
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 22,
              color: Colors.grey,
            ),
          )),
    );
  }
}
