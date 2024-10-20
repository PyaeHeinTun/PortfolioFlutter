import 'package:flutter/material.dart';
import 'package:portfolio_web/my_data.dart';
import 'package:portfolio_web/screen/home/component/button_widget.dart';
import 'package:portfolio_web/screen/home/component/gretting_name.dart';
import 'package:portfolio_web/shared_component/description_text.dart';
import 'package:portfolio_web/screen/home/component/job_title.dart';
import 'package:portfolio_web/controller/menu_controller.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.1,
          ),
          const GrettingName(
            greetingIntro: "Hello, my name is ",
          ),
          const JobTitle(),
          const SizedBox(
            height: 25,
          ),
          DescriptionText(
            text: myData['main_content']['description'],
          ),
          SizedBox(
            height: height * 0.1,
          ),
          Consumer<MenuDrawerController>(
            builder: (context, menuController, _) {
              return menuController.isOpenMenu
                  ? const SizedBox()
                  : const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonWidget(buttonText: "More About Me"),
                        ButtonWidget(buttonText: "Download CV"),
                      ],
                    );
            },
          ),
        ],
      ),
    );
  }
}
