import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign? textAlign; // optional parameter

  const MyText({
    super.key,
    required this.text,
    required this.color,
    required this.fontSize,
    required this.fontWeight,
    this.textAlign, // optional in constructor
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign, // can be null
      style: GoogleFonts.notoSansAdlam(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
