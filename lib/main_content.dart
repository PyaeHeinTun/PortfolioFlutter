import 'package:flutter/material.dart';
import 'package:portfolio_web/screen/about/about_screen.dart';
import 'package:portfolio_web/screen/contact/contact_screen.dart';
import 'package:portfolio_web/screen/home/home_screen.dart';
import 'package:portfolio_web/screen/projects/project_screen.dart';
import 'package:portfolio_web/controller/menu_controller.dart';
import 'package:portfolio_web/menu/component/menu_icon.dart';
import 'package:portfolio_web/my_data.dart';
import 'package:portfolio_web/shared_component/decide_screen_type.dart';
import 'package:provider/provider.dart';

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    const double paddingT = 20;
    const double paddingL = 25;
    const double paddingR = 25;
    var width = MediaQuery.of(context).size.width;

    return Container(
      padding:
          const EdgeInsets.only(top: paddingT, left: paddingL, right: paddingR),
      color: myData['colors']['background_color'],
      child: Consumer<MenuDrawerController>(
        builder: (context, menuController, child) {
          return Stack(
            children: [
              buildContentScreen(context),
              DecideScreenType.decide(width) == ScreenType.small
                  ? const MenuIcon()
                  : const SizedBox(),
            ],
          );
        },
      ),
    );
  }
}

Widget buildContentScreen(BuildContext context) {
  int selectedMenuIndex =
      Provider.of<MenuDrawerController>(context, listen: false)
          .selectedMenuIndex;
  var width = MediaQuery.of(context).size.width;

  List<Widget> widgetList = const [
    HomeScreen(),
    AboutScreen(),
    ProjectScreen(),
    ContactScreen(),
  ];

  for (var i = 0; i < widgetList.length; i++) {
    if (selectedMenuIndex == i) {
      return Container(
        margin: const EdgeInsets.only(top: 50),
        padding: DecideScreenType.decide(width) == ScreenType.small
            ? const EdgeInsets.symmetric(horizontal: 0)
            : EdgeInsets.symmetric(horizontal: width * 0.05),
        child: widgetList[i],
      );
    }
  }
  return const Text("Null");
}
