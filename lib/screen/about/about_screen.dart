import 'package:flutter/material.dart';
import 'package:portfolio_web/my_data.dart';
import 'package:portfolio_web/screen/about/component/education_widget.dart';
import 'package:portfolio_web/screen/about/component/info_widget.dart';
import 'package:portfolio_web/screen/about/component/skill_widget.dart';
import 'package:portfolio_web/screen/home/component/gretting_name.dart';
import 'package:portfolio_web/shared_component/description_text.dart';
import 'package:portfolio_web/shared_component/section_title_text.dart';
import 'package:portfolio_web/shared_component/title_text.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          const TitleText(text: "About Me"),
          const SizedBox(
            height: 30,
          ),
          const GrettingName(
            greetingIntro: "I'm ",
          ),
          DescriptionText(
            text: myData['main_content']['description'],
          ),

          // Info Birthday , Age , Country , Email , Degree , Phone, City , Status
          const InfoWidget(),

          // Skills HTML CSS JS Python Java Dart
          const SizedBox(
            height: 30,
          ),
          const SectionTitleText(text: "Skills"),
          const SizedBox(
            height: 10,
          ),
          const SkillWidget(),
          const SizedBox(
            height: 30,
          ),
          const SectionTitleText(text: "Education"),
          // Education
          const SizedBox(
            height: 10,
          ),
          const EducationWidget(),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
