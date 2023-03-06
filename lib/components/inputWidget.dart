import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final TextEditingController controller;
  final String errorText;
  final bool obscureText;
  final String hintText;
  final Color color;

  const CustomInputField({
    super.key,
    required this.controller,
    this.errorText = "",
    this.obscureText = false,
    this.hintText = "",
    this.color = const Color.fromRGBO(255, 255, 255, 0.8),
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != "")
          Text(
            errorText,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 20.0,
            ),
          ),
        const SizedBox(height: 20.0),
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextFormField(
              style: TextStyle(),
              decoration: InputDecoration(
                label: hintText == "" ? null : Text(hintText),
                labelStyle: TextStyle(
                  color: color,
                ),
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    style: BorderStyle.solid,
                    color: Colors.red,
                    width: 3.0,
                  ),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
              ),
              obscureText: obscureText,
              controller: controller,
              keyboardType: TextInputType.emailAddress,
            ),
          ),
        ),
      ],
    );
  }
}
