import 'package:flutter/material.dart';
import 'package:portfolio_web/controller/menu_controller.dart';
import 'package:portfolio_web/my_data.dart';
import 'package:portfolio_web/screen/about/component/education_widget.dart';
import 'package:portfolio_web/screen/about/component/info_widget.dart';
import 'package:portfolio_web/screen/about/component/skill_widget.dart';
import 'package:portfolio_web/screen/home/component/gretting_name.dart';
import 'package:portfolio_web/shared_component/description_text.dart';
import 'package:portfolio_web/shared_component/section_title_text.dart';
import 'package:portfolio_web/shared_component/title_text.dart';
import 'package:provider/provider.dart';

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

          Consumer<MenuDrawerController>(builder: (context, menuController, _) {
            if (menuController.isMenuLoading || menuController.isOpenMenu) {
              return const SizedBox();
            }
            return const Column(
              children: [
                // Skills HTML CSS JS Python Java Dart
                SizedBox(
                  height: 30,
                ),
                SectionTitleText(text: "Skills"),
                SizedBox(
                  height: 10,
                ),
                SkillWidget(),
                SizedBox(
                  height: 30,
                ),
                SectionTitleText(text: "Education"),
                // Education
                SizedBox(
                  height: 10,
                ),
                EducationWidget(
                  isEducation: true,
                ),

                SizedBox(
                  height: 30,
                ),
                SectionTitleText(text: "Work History"),
                SizedBox(
                  height: 10,
                ),
                EducationWidget(
                  isEducation: false,
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
