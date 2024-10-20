import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_web/my_data.dart';
import 'package:typewritertext/typewritertext.dart';

class GrettingName extends StatelessWidget {
  const GrettingName({
    super.key,
    required this.greetingIntro,
  });

  final String greetingIntro;

  @override
  Widget build(BuildContext context) {
    final controller = TypeWriterController(
      text: myData['main_content']['name'],
      repeat: true,
      duration: const Duration(milliseconds: 150),
    );

    return SizedBox(
      height: 80,
      child: TypeWriter(
        controller: controller,
        builder: (context, value) {
          return Text.rich(
            TextSpan(
              text: greetingIntro,
              style: GoogleFonts.akatab(
                fontSize: 28,
                color: myData['colors']['text_color'],
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: value.text,
                  style: GoogleFonts.pacifico(
                    color: myData['colors']['primary_color'],
                    fontSize: 24,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
