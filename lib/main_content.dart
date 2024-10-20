import 'package:flutter/material.dart';
import 'package:portfolio_web/screen/about/about_screen.dart';
import 'package:portfolio_web/screen/contact/contact_screen.dart';
import 'package:portfolio_web/screen/home/home_screen.dart';
import 'package:portfolio_web/screen/projects/project_screen.dart';
import 'package:portfolio_web/controller/menu_controller.dart';
import 'package:portfolio_web/menu/component/menu_icon.dart';
import 'package:portfolio_web/my_data.dart';
import 'package:provider/provider.dart';

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    const double paddingT = 20;
    const double paddingL = 25;
    const double paddingR = 25;

    return Container(
      padding:
          const EdgeInsets.only(top: paddingT, left: paddingL, right: paddingR),
      color: myData['colors']['background_color'],
      child: Consumer<MenuDrawerController>(
        builder: (context, menuController, child) {
          return Stack(
            children: [
              buildContentScreen(context),
              const MenuIcon(),
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
        child: widgetList[i],
      );
    }
  }
  return const Text("Null");
}
