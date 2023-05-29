import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? buttonColor; // Update the parameter type to Color?
  final Color foregroundColor; // Add foregroundColor parameter

  const MyButton({
    required this.onPressed,
    required this.text,
    required this.foregroundColor, // Add foregroundColor
    this.buttonColor, // Update the parameter type to Color?
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: foregroundColor, // Use the provided foregroundColor
        backgroundColor: buttonColor, // Use the nullable buttonColor
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 32.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
    );
  }
}
