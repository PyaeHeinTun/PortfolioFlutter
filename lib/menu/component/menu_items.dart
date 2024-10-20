import 'package:flutter/material.dart';
import 'package:portfolio_web/controller/menu_controller.dart';
import 'package:portfolio_web/menu/side_menu.dart';
import 'package:portfolio_web/my_data.dart';
import 'package:provider/provider.dart';

class MenuItemWidget extends StatelessWidget {
  const MenuItemWidget({
    super.key,
    required this.menuItem,
    required this.isActive,
  });

  final MenuItem menuItem;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    Color selectColor = myData['colors']['primary_color'];
    Color unselectColor = myData['colors']['text_color'];
    double width = MediaQuery.of(context).size.width;
    double menuWidth = width / myData['menu']['menu_width'];

    Color activeColor = isActive ? selectColor : unselectColor;

    return GestureDetector(
      onTap: () {
        Provider.of<MenuDrawerController>(context, listen: false)
            .changeMenuIndex(menuItem.index);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: menuWidth / 1.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Icon(
                    menuItem.icon,
                    color: activeColor,
                    size: 28,
                  ),
                ),
                Expanded(
                  child: Text(
                    menuItem.name,
                    style: TextStyle(
                      color: activeColor,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: menuWidth / 1.4,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: unselectColor.withOpacity(0.2),
                  width: 3,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
