import "package:flutter/material.dart";

class SearchHall extends StatelessWidget {
  const SearchHall({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: <Widget>[
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: "Search for a hall",
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    style: BorderStyle.solid,
                    color: Colors.red,
                    width: 3.0,
                  ),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
              ),
              obscureText: false,
              controller: TextEditingController(),
              keyboardType: TextInputType.text,
            ),
          ),
        ),
        const SizedBox(height: 20.0),
        const Expanded(
          child: Center(
            child: Text(
              "No results found",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
