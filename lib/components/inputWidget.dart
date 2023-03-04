import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String title;
  final String placeholder;
  final TextInputType type;
  final TextEditingController controller;
  final bool isPassword;

  const CustomInputField({super.key,
    required this.title,
    required this.placeholder,
    required this.type,
    required this.controller,
    this.isPassword = false,
    required Color backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10.0),
        TextFormField(
          controller: controller,
          keyboardType: type,
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: placeholder,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey[200],
            contentPadding: const EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: 20.0,
            ),
          ),
        ),
      ],
    );
  }
}
