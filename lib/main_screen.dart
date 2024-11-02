import 'package:flutter/material.dart';
import 'package:portfolio_web/main_content.dart';
import 'package:portfolio_web/controller/menu_controller.dart';
import 'package:portfolio_web/menu/side_menu.dart';
import 'package:portfolio_web/my_data.dart';
import 'package:portfolio_web/shared_component/decide_screen_type.dart';
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

  setScreenValue() {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    menuWidth = DecideScreenType.decide(width!) == ScreenType.small
        ? width! / myData['menu']['menu_width']
        : width! * 0.3;

    Provider.of<MenuDrawerController>(context, listen: false)
        .setScreenType(width!);
  }

  @override
  void didChangeDependencies() {
    setScreenValue();
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
            left: DecideScreenType.decide(width!) == ScreenType.small
                ? menuController.drawerAnimation!.value
                : 0,
            top: 0,
            height: height!,
            width: menuWidth!,
            child: SideMenu(
              menuWidth: menuWidth!,
            ),
          ),
          // Body Content
          Positioned(
            top: 0,
            right: 0,
            height: height,
            width: menuController.contentAnimation!.value -
                (DecideScreenType.decide(width!) == ScreenType.large
                    ? menuWidth!
                    : 0),
            child: const MainContent(),
          ),
        ],
      );
    });
  }
}
