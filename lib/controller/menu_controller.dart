import 'package:flutter/material.dart';

class MenuDrawerController extends ChangeNotifier {
  int selectedMenuIndex = 0;
  bool isOpenMenu = false;

  AnimationController? drawerAnimationController;
  Animation<double>? drawerAnimation;

  AnimationController? contentAnimationController;
  Animation<double>? contentAnimation;

  void setUpDrawerAnimation(
      {required TickerProvider ticker,
      required double start,
      required double end}) {
    drawerAnimationController = AnimationController(
      vsync: ticker,
    );
    drawerAnimation = Tween<double>(begin: start, end: end)
        .animate(drawerAnimationController!)
      ..addListener(() {
        notifyListeners();
      });
  }

  void setUpContentAnimation(
      {required TickerProvider ticker,
      required double start,
      required double end}) {
    contentAnimationController = AnimationController(
      vsync: ticker,
    );
    contentAnimation = Tween<double>(begin: start, end: end)
        .animate(contentAnimationController!)
      ..addListener(() {
        notifyListeners();
      });
  }

  void disposeDrawerAnimation() {
    drawerAnimationController!.dispose();
  }

  void disposeContentAnimation() {
    contentAnimationController!.dispose();
  }

  void changeMenuIndex(int index) {
    selectedMenuIndex = index;
    isOpenMenu = false;
    notifyListeners();

    drawerAnimationController!.duration = const Duration(milliseconds: 800);
    contentAnimationController!.duration = const Duration(milliseconds: 500);

    drawerAnimationController!.reverse();
    contentAnimationController!.reverse();
  }

  void toggleMenu() {
    isOpenMenu = !isOpenMenu;
    if (isOpenMenu) {
      drawerAnimationController!.duration = const Duration(milliseconds: 0);
      contentAnimationController!.duration = const Duration(milliseconds: 500);

      drawerAnimationController!.forward();
      contentAnimationController!.forward();
    } else {
      drawerAnimationController!.duration = const Duration(milliseconds: 800);
      contentAnimationController!.duration = const Duration(milliseconds: 500);

      drawerAnimationController!.reverse();
      contentAnimationController!.reverse();
    }
    notifyListeners();
  }
}
