import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_web/my_data.dart';

class SectionTitleText extends StatelessWidget {
  const SectionTitleText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.rubik(
        color: myData['colors']['text_color'],
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
