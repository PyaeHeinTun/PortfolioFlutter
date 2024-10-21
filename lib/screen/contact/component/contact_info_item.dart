import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_web/my_data.dart';
import 'package:portfolio_web/screen/contact/contact_screen.dart';

class ContactInfoItem extends StatelessWidget {
  const ContactInfoItem({
    super.key,
    required this.contactData,
  });

  final ContactData contactData;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          contactData.icon,
          color: myData['colors']['primary_color'],
          size: 24,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          contactData.name,
          style: GoogleFonts.timmana(
            color: myData['colors']['text_color'],
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          contactData.data,
          style: GoogleFonts.timmana(
            color: myData['colors']['text_color'].withOpacity(0.7),
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
