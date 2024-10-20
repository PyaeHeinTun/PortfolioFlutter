import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_web/my_data.dart';
import 'package:typewritertext/typewritertext.dart';

class JobTitle extends StatelessWidget {
  const JobTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TypeWriterController(
      text: myData['main_content']['title'],
      repeat: true,
      duration: const Duration(milliseconds: 150),
    );

    return TypeWriter(
      controller: controller,
      builder: (context, value) {
        return Text.rich(
          TextSpan(
            text: "I'm a ",
            style: GoogleFonts.akatab(
              fontSize: 28,
              color: myData['colors']['text_color'],
              fontWeight: FontWeight.w700,
            ),
            children: [
              TextSpan(
                text: value.text,
                style: GoogleFonts.barlowCondensed(
                  color: myData['colors']['primary_color'],
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
