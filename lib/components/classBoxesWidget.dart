import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClassBoxWidget extends StatefulWidget {
  const ClassBoxWidget({super.key});

  @override
  State<ClassBoxWidget> createState() => _ClassBoxWidgetState();
}

class _ClassBoxWidgetState extends State<ClassBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 150.0,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 150.0,
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.orange
                  : Colors.grey,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: ListTile(
              title: Text(
                "Class ${index + 1}",
                style: GoogleFonts.mcLaren(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
              ),
              subtitle: Text(
                "Class ${index + 1} description",
                style: GoogleFonts.mcLaren(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            )
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 10.0,
          );
        },
      ),
    );
  }
}
