import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_web/my_data.dart';

class DescriptionText extends StatelessWidget {
  const DescriptionText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.afacad(
        color: myData['colors']['text_color'],
        fontSize: 24,
      ),
    );
  }
}
