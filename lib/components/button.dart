import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mb_quiz/constants/colors.dart';

class Button extends StatelessWidget {
  final String text;
  final Color color;
  final void Function() ? press;
  const Button({super.key, required this.text, required this.press, required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Material(
        color: color,
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(10),
        shadowColor: Colors.grey,
        child: InkWell(
          onTap: press,
          child: Center(child: Text(text, style: GoogleFonts.inter(color: white, fontSize: 18),)),
        ),
      ),
    );
        
  }
}