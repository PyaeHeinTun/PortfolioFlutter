import 'package:flutter/material.dart';
import 'package:portfolio_web/controller/menu_controller.dart';
import 'package:portfolio_web/my_data.dart';
import 'package:provider/provider.dart';

class MenuIcon extends StatelessWidget {
  const MenuIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<MenuDrawerController>(context, listen: false).toggleMenu();
      },
      child: Container(
        width: 60,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: myData['colors']['menu_color'],
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        padding: const EdgeInsets.all(10),
        child: Consumer<MenuDrawerController>(
          builder: (context, controller, child) {
            return controller.isOpenMenu
                ? Icon(
                    Icons.close,
                    color: myData['colors']['primary_color'],
                    size: 30,
                  )
                : Icon(
                    Icons.menu,
                    color: myData['colors']['primary_color'],
                    size: 30,
                  );
          },
        ),
      ),
    );
  }
}
