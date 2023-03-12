import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import "../constants/fonts.dart";

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkMode = false;
  String _dropDownValue = "English";
  bool _enableNotification = false;
  double _currentValue = 14;

  bool _isSwitched = false;
  bool _isDark = false;

  @override
  Widget build(BuildContext context) {
    String dropdownvalue = 'Change your font';
    // email : hello@vacua.page
    fontItems(context) => [
          {
            "text": "MCLaren",
            "style": GoogleFonts.mcLaren(
              fontSize: _currentValue,
              color: Theme.of(context).primaryColor,
            ),
          },
          {
            "text": "Roboto",
            "style": GoogleFonts.roboto(
              fontSize: _currentValue,
              color: Theme.of(context).primaryColor,
            ),
          },
          {
            "text": "Open Sans",
            "style": GoogleFonts.openSans(
              fontSize: _currentValue,
              color: Theme.of(context).primaryColor,
            ),
          },
          {
            "text": "Lato",
            "style": GoogleFonts.lato(
              fontSize: _currentValue,
              color: Theme.of(context).primaryColor,
            ),
          },
          {
            "text": "Raleway",
            "style": GoogleFonts.raleway(
              fontSize: _currentValue,
              color: Theme.of(context).primaryColor,
            ),
          },
          {
            "text": "Poppins",
            "style": GoogleFonts.poppins(
              fontSize: _currentValue,
              color: Theme.of(context).primaryColor,
            ),
          },
          {
            "text": "Nunito",
            "style": GoogleFonts.nunito(
              fontSize: _currentValue,
              color: Theme.of(context).primaryColor,
            ),
          },
          {
            "text": "Montserrat",
            "style": GoogleFonts.montserrat(
              fontSize: _currentValue,
              color: Theme.of(context).primaryColor,
            ),
          },
        ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Settings"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10.0),
          child: Container(
            color: Colors.black,
            height: 1.0,
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          Container(
            width: double.infinity,
            // height: 300.0,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Font",
                  style: GoogleFonts.mcLaren(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Lorem ipsum dolor sit amet consectetur. Tempus placerat commodo ipsum lacus. Elit neque amet vitae molestie auctor.",
                  style: GoogleFonts.mcLaren(
                    fontSize: 14.0,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: DropdownButton(
                    isExpanded: true,
                    value: fontItems(context)[0]["text"],
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: fontItems(context).map((Map<String, dynamic> item) {
                      return DropdownMenuItem(
                        value: item["text"],
                        child: Text(
                          item["text"],
                          style: item["style"],
                        ),
                      );
                    }).toList(),
                    onChanged: (Object? value) {
                      // on change override the textTheme of the app
                      // and set the new font
                      setState(() {
                        dropdownvalue = value.toString();
                      });
                    },
                  ),
                ),
                Row(children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Slider(
                        value: _currentValue,
                        min: 12.0,
                        max: 20.0,
                        divisions: 10,
                        label: "$_currentValue",
                        onChanged: (double value) {
                          setState(() {
                            _currentValue = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 8.0),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 15.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      "${_currentValue.toInt()}",
                      style: GoogleFonts.mcLaren(
                        fontSize: 20.0,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  )
                ]),
                const SizedBox(height: 10.0),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      width: 1.0,
                      color: Colors.black,
                    ),
                  ),
                  child: Text(
                    "Lorem ipsum dolor sit amet consectetur. Tempus placerat commodo ipsum lacus.",
                    style: TextStyle(
                      fontFamily: dropdownvalue,
                      fontSize: _currentValue,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Notifications",
                  style: GoogleFonts.mcLaren(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: <Widget>[
                    const SizedBox(
                      width: 260.0,
                      child: Text(
                        "Receive Notifications when a previous hall is free!",
                        maxLines: 3,
                      ),
                    ),
                    Switch(
                      focusColor: Colors.red,
                      activeColor: Theme.of(context).primaryColor,
                      thumbColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor),
                      value: _isSwitched,
                      onChanged: (bool value) {
                        setState(() {
                          _isSwitched = value;
                        });
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Theme",
                  style: GoogleFonts.mcLaren(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: <Widget>[
                    const SizedBox(
                      width: 260.0,
                      child: Text(
                        "Dark Mode",
                        maxLines: 3,
                      ),
                    ),
                    Switch(
                      focusColor: Colors.red,
                      activeColor: Theme.of(context).primaryColor,
                      thumbColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor),
                      value: _isDark,
                      onChanged: (bool value) {
                        setState(() {});
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Note",
                  style: GoogleFonts.mcLaren(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: <Widget>[
                    const SizedBox(
                      width: 260.0,
                      child: Text(
                        "Give us a feedback",
                        maxLines: 3,
                      ),
                    ),
                    Icon(
                      Icons.star,
                      size: 30.0,
                      color: Theme.of(context).primaryColor,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
