import "package:flutter/material.dart";

class SearchHall extends StatelessWidget {
  const SearchHall({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: const Center(
          child: Icon(
            Icons.search,
            size: 100,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}