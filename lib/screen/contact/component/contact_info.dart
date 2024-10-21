import 'package:flutter/material.dart';
import 'package:portfolio_web/my_data.dart';
import 'package:portfolio_web/screen/contact/component/contact_info_item.dart';
import 'package:portfolio_web/screen/contact/contact_screen.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: buildContactInfo(),
    );
  }
}

List<Widget> buildContactInfo() {
  List<Widget> widgetList = [];
  List<ContactData> contactList = myData['contact_content']['contact_info'];

  for (var i = 0; i < contactList.length; i++) {
    widgetList.add(
      Container(
        margin: const EdgeInsets.only(top: 50),
        child: Center(
          child: ContactInfoItem(
            contactData: contactList[i],
          ),
        ),
      ),
    );
  }

  widgetList.add(
    const SizedBox(
      height: 60,
    ),
  );
  return widgetList;
}
