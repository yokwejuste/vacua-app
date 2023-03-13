import "dart:ui";

import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
// App localizations
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import "../main.dart";

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  bool _darkMode = false;
  String _dropDownValue = "English";
  bool _enableNotification = false;
  double _currentValue = 14;

  bool _isSwitched = false;
  bool _isDark = false;

  String selectedLanguage = window.locale.languageCode == "fr" ? "fr" : "en";

  @override
  Widget build(BuildContext context) {
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
                  AppLocalizations.of(context)!.notifications,
                  style: GoogleFonts.mcLaren(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 260.0,
                      child: Text(
                        AppLocalizations.of(context)!.notification_text,
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
                  AppLocalizations.of(context)!.theme,
                  style: GoogleFonts.mcLaren(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 260.0,
                      child: Text(
                        AppLocalizations.of(context)!.theme_text,
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
                  AppLocalizations.of(context)!.language,
                  style: GoogleFonts.mcLaren(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                DropdownButton(
                    value: selectedLanguage,
                    items: const <DropdownMenuItem>[
                      DropdownMenuItem(
                        value: "en",
                        child: Text("English"),
                      ),
                      DropdownMenuItem(
                        value: "fr",
                        child: Text("Francais"),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedLanguage = value.toString();
                      });
                      ref.read(localeProvider.notifier).state = Locale(value);
                    })
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
                  AppLocalizations.of(context)!.note,
                  style: GoogleFonts.mcLaren(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 260.0,
                      child: Text(
                        AppLocalizations.of(context)!.note_text,
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
