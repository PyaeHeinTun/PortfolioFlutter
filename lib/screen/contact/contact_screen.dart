import 'package:flutter/material.dart';
import 'package:portfolio_web/screen/contact/component/contact_info.dart';
import 'package:portfolio_web/screen/contact/component/contact_title.dart';
import 'package:portfolio_web/shared_component/title_text.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          TitleText(text: "Contact Me"),
          SizedBox(
            height: 20,
          ),
          ContactTitle(),
          SizedBox(
            height: 30,
          ),
          ContactInfo(),
        ],
      ),
    );
  }
}

class ContactData {
  final IconData icon;
  final String name;
  final String data;

  ContactData({
    required this.icon,
    required this.name,
    required this.data,
  });
}
