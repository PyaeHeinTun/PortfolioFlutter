import 'package:flutter/material.dart';
import 'package:portfolio_web/main_content.dart';
import 'package:portfolio_web/controller/menu_controller.dart';
import 'package:portfolio_web/menu/side_menu.dart';
import 'package:portfolio_web/my_data.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  double? width;
  double? height;
  double? menuWidth;

  @override
  void didChangeDependencies() {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    menuWidth = width! / myData['menu']['menu_width'];

    Provider.of<MenuDrawerController>(context, listen: false)
        .setUpDrawerAnimation(ticker: this, start: -width!, end: 0);
    Provider.of<MenuDrawerController>(context, listen: false)
        .setUpContentAnimation(
            ticker: this, start: width!, end: (width! - menuWidth!));
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    Provider.of<MenuDrawerController>(context, listen: false)
        .disposeDrawerAnimation();
    Provider.of<MenuDrawerController>(context, listen: false)
        .disposeContentAnimation();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuDrawerController>(
        builder: (context, menuController, _) {
      return Stack(
        children: [
          // Side Menu
          Positioned(
            left: menuController.drawerAnimation!.value,
            top: 0,
            height: height,
            width: menuWidth,
            child: const SideMenu(),
          ),

          // Body Content
          Positioned(
            top: 0,
            right: 0,
            height: height,
            width: menuController.contentAnimation!.value,
            child: const MainContent(),
          ),
        ],
      );
    });
  }
}
