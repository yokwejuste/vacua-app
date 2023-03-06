import "package:flutter/material.dart";
import "package:vacua_app/constants/colors.dart";

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkMode = false;
  String _dropDownValue = "English";
  bool _enableNotification = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Settings",
          style: TextStyle(
            color: Colors.black,
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
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        children: <Widget>[
          const SizedBox(
            height: 25.0,
          ),
          const Text(
            "ACCOUNT",
            style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: const <Widget>[
              Icon(
                Icons.email,
                color: Colors.black,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                "vacuaemail@vaua.app",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            color: Colors.black,
            height: 20,
          ),
          const Text(
            "OPTIONS",
            style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: <Widget>[
              const Text(
                "Dark Mode",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20.0,
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Checkbox(
                  value: _darkMode,
                  onChanged: (value) {
                    setState(() {
                      _darkMode = value!;
                    });
                  }),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          DropdownButton(
              value: _dropDownValue,
              items: <String>["English", "French "]
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,
                      style:
                          const TextStyle(fontSize: 20.0, color: Colors.grey)),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  _dropDownValue = value!;
                });
              }),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              const Text(
                "Notifications",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20.0,
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Checkbox(
                  value: _enableNotification,
                  onChanged: (value) {
                    setState(() {
                      _enableNotification = value!;
                    });
                  }),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {},
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.all(0),
                ),
                alignment: Alignment.centerLeft,
              ),
              child: const Text(
                "Add WhatsApp class group",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20.0,
                ),
              ))
        ],
      ),
    );
  }
}
