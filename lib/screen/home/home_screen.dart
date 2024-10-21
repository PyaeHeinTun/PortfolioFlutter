import 'package:flutter/material.dart';
import 'package:portfolio_web/my_data.dart';
import 'package:portfolio_web/screen/home/component/button_widget.dart';
import 'package:portfolio_web/screen/home/component/gretting_name.dart';
import 'package:portfolio_web/shared_component/description_text.dart';
import 'package:portfolio_web/screen/home/component/job_title.dart';
import 'package:portfolio_web/controller/menu_controller.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonWidget(
                    buttonText: "More About Me",
                    callBackFun: () {
                      Provider.of<MenuDrawerController>(context, listen: false)
                          .toggleMenu();
                      Provider.of<MenuDrawerController>(context, listen: false)
                          .changeMenuIndex(1);
                      // Future.delayed(const Duration(milliseconds: 500))
                      //     .then((_) {
                      //   Provider.of<MenuDrawerController>(context,
                      //           listen: false)
                      //       .toggleMenu();
                      // });
                    },
                  ),
                  ButtonWidget(
                    buttonText: "Download CV",
                    callBackFun: () async {
                      final Uri url =
                          Uri.parse(myData['main_content']['cv_url']);
                      if (!await launchUrl(url)) {
                        throw Exception('Could not launch $url');
                      }
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
