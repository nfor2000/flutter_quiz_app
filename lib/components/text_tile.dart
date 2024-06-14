import 'package:flutter/material.dart';

class TextInter extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  const TextInter({super.key, required this.text, required this.color, required this.fontWeight, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style: TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}