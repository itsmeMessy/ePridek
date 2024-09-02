import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; 

class MyButton extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final double width; 
  final double height; 

  const MyButton({
    super.key,
    required this.text,
    this.style,
    this.width = 1000, 
    this.height = 50.0, 
    required Null Function() onPressed, 
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: width, 
        height: height, 
        decoration: BoxDecoration(
          color: const Color(0xFFC8ACD6),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            style: style ??
                GoogleFonts.lato(
                  textStyle: const TextStyle(
                    color: Color(0xFF17153B),
                    fontWeight: FontWeight.bold,
                    fontSize: 16, 
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
