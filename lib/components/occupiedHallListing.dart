import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vacua_app/models/halls.dart';
import 'package:vacua_app/services/HallService.dart';

class OccupiedHallListing extends ConsumerStatefulWidget {
  const OccupiedHallListing({super.key});

  @override
  OccupiedHallListingState createState() => OccupiedHallListingState();
}

class OccupiedHallListingState extends ConsumerState<OccupiedHallListing> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 150.0,
      child: FutureBuilder<List<dynamic>>(
          future: HallService(ref: ref).getOccupiedHalls(),
          builder: (context, snapshot) {
            print(snapshot);
            if (snapshot.hasData) {
              var data = snapshot.data!;
              return customListView(
                data: data,
              );
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return const Text("There was a problem getting halls");
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

class customListView extends StatelessWidget {
  final data;
  const customListView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: data.length,
      itemBuilder: (BuildContext context, index) {
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
                "${data[index].name}",
                style: GoogleFonts.mcLaren(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
              ),
              subtitle: Text(
                "${data[index].school}",
                style: GoogleFonts.mcLaren(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ));
      },
      separatorBuilder: (BuildContext context, index) {
        return const SizedBox(
          width: 10.0,
        );
      },
    );
  }
}
