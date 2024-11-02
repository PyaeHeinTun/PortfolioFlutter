import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_web/controller/menu_controller.dart';
import 'package:portfolio_web/menu/component/menu_items.dart';
import 'package:portfolio_web/my_data.dart';
import 'package:portfolio_web/shared_component/decide_screen_type.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
    required this.menuWidth,
  });
  final double menuWidth;

  @override
  Widget build(BuildContext context) {
    String imgPath = myData['menu']['profile_img'];

    const double paddingT = 20;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    List<MenuItem> menuItems = [
      MenuItem(icon: Icons.home, name: "Home", index: 0),
      MenuItem(icon: Icons.person, name: "About", index: 1),
      MenuItem(icon: Icons.edit_document, name: "Projects", index: 2),
      MenuItem(icon: Icons.contact_mail_outlined, name: "Contact", index: 3),
    ];

    return Container(
      color: myData['colors']['menu_color'],
      child: Column(
        children: [
          const SizedBox(
            height: paddingT * 4,
          ),
          // Profile
          Container(
            height: (menuWidth / 2 >= 200) ? 200 : menuWidth / 2,
            width: (menuWidth / 2 >= 200) ? 200 : menuWidth / 2,
            constraints: const BoxConstraints(maxWidth: 200),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                  (menuWidth / 2 >= 200) ? 200 : menuWidth / 2),
              child: CachedNetworkImage(
                imageUrl: imgPath,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          SizedBox(
            height: DecideScreenType.decide(width) == ScreenType.small
                ? paddingT
                : height * paddingT * 0.01,
          ),
          // Section
          Expanded(
            child: Consumer<MenuDrawerController>(
              builder: (context, value, child) {
                return Padding(
                  padding: DecideScreenType.decide(width) == ScreenType.small
                      ? const EdgeInsets.all(0)
                      : EdgeInsets.symmetric(horizontal: (width) * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: buildMenuItems(context, menuItems),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> buildMenuItems(BuildContext context, List<MenuItem> items) {
  int selectedMenuIndex =
      Provider.of<MenuDrawerController>(context, listen: false)
          .selectedMenuIndex;

  var width = MediaQuery.of(context).size.width;
  var height = MediaQuery.of(context).size.height;

  List<Widget> widgetList = [];

  bool shouldAddSpaceInBettwenMenuItems =
      DecideScreenType.decide(width) == ScreenType.large;

  for (var i = 0; i < items.length; i++) {
    if (i == selectedMenuIndex) {
      widgetList.add(MenuItemWidget(menuItem: items[i], isActive: true));

      if (shouldAddSpaceInBettwenMenuItems) {
        widgetList.add(
          SizedBox(
            height: height * 0.02,
          ),
        );
      }
    } else {
      widgetList.add(MenuItemWidget(menuItem: items[i], isActive: false));

      if (shouldAddSpaceInBettwenMenuItems) {
        widgetList.add(
          SizedBox(
            height: height * 0.02,
          ),
        );
      }
    }
  }

  return widgetList;
}

class MenuItem {
  final String name;
  final IconData icon;
  final int index;

  MenuItem({
    required this.name,
    required this.icon,
    required this.index,
  });
}
