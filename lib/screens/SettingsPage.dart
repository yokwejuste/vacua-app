import "package:flutter/material.dart";
import "package:vacua_app/constants/colors.dart";

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Container(
          margin: const EdgeInsets.all(5.0),
          padding: const EdgeInsets.all(5.0),
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: kPrimaryColor),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              // TODO: Add navigation to the previous page
            },
          ),
        ),
        title: const Align(
          alignment: Alignment.centerRight,
          child: Text(
            "Settings",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
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
        children: <Widget>[
          SizedBox(
            height: 25.0,
          ),
        ],
      ),
    );
  }
}
