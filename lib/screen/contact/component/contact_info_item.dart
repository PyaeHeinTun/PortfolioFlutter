import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_web/my_data.dart';
import 'package:portfolio_web/screen/contact/contact_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactInfoItem extends StatelessWidget {
  const ContactInfoItem({
    super.key,
    required this.contactData,
  });

  final ContactData contactData;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Material(
        elevation: 10,
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: () {
            if (contactData.name.toLowerCase().contains("call")) {
              launchUrlString("tel://${contactData.data}");
            }
            if (contactData.name.toLowerCase().contains("mail")) {
              String? encodeQueryParameters(Map<String, String> params) {
                return params.entries
                    .map((MapEntry<String, String> e) =>
                        '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                    .join('&');
              }

              final Uri emailLaunchUri = Uri(
                scheme: 'mailto',
                path: contactData.data,
                query: encodeQueryParameters(<String, String>{
                  'subject': 'I would like to contact you.',
                }),
              );

              launchUrl(emailLaunchUri);
            }
            if (contactData.name.toLowerCase().contains("message")) {
              launchUrlString(contactData.data);
            }
          },
          child: Column(
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
          ),
        ),
      ),
    );
  }
}
