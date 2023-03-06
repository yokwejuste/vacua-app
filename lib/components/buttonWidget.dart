import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isEnabled;
  final double width;
  final Color textColor;
  final Color buttonColor;
  final Color disabledColor;
  final double height;

  const CustomButton({super.key,
    required this.label,
    required this.onPressed,
    this.isEnabled = true,
    this.width = 120.0,
    this.height = 40.0,
    this.textColor = const Color.fromRGBO(146, 29, 218, 1),
    this.buttonColor = const Color.fromRGBO(255, 255, 255, 1),
    this.disabledColor = Colors.grey,
  });

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: ElevatedButton(
        onPressed: widget.isEnabled ? widget.onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              widget.isEnabled ? widget.buttonColor : widget.disabledColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        child: Text(
          widget.label.toString(),
          style: TextStyle(color: widget.textColor).copyWith(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
