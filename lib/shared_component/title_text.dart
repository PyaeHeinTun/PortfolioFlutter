import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_web/my_data.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: GoogleFonts.rubik(
            color: myData['colors']['text_color'],
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          width: 60,
          height: 5,
          decoration: BoxDecoration(
            color: myData['colors']['primary_color'],
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          width: 30,
          height: 5,
          decoration: BoxDecoration(
            color: myData['colors']['primary_color'],
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ],
    );
  }
}
