import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Button extends StatelessWidget {
  final String text;
  final Color color;
  final int width;
  final Function ontap; // Change to VoidCallback for better type safety

  Button({
    super.key,
    required this.text,
    required this.color,
    this.width = 80,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ontap(), // Correctly call the ontap function
      child: Container(
        width: width.toDouble(), // Use width property dynamically
        height: width.toDouble(), // Maintain circular shape
        alignment: Alignment.center, // Center the text inside the button
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle, // Set the shape to circle
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black, // Text color
            fontSize: 30, // Text size
          ),
        ),
      ),
    );
  }
}
