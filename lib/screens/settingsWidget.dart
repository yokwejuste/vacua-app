import "package:flutter/material.dart";

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 25.0,
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0),
            child: Text(
              "Settings",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 10.0,
            ),
            height: 2.0,
            width: double.infinity,
            color: Color.fromARGB(255, 87, 87, 87),
          ),
        ],
      ),
    );
  }
}
