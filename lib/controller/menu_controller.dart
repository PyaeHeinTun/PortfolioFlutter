import 'package:flutter/material.dart';

class MenuDrawerController extends ChangeNotifier {
  int selectedMenuIndex = 0;
  bool isOpenMenu = false;
  bool isMenuLoading = false;

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
        if (drawerAnimationController!.isAnimating) {
          isMenuLoading = true;
        }
        if (drawerAnimationController!.isCompleted) {
          isMenuLoading = false;
        }
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
        if (contentAnimationController!.isAnimating) {
          isMenuLoading = true;
        }
        if (contentAnimationController!.isCompleted) {
          isMenuLoading = false;
        }
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

    _reverseAnimationDrawer();
  }

  void _reverseAnimationDrawer() {
    drawerAnimationController!.duration = const Duration(milliseconds: 800);
    contentAnimationController!.duration = const Duration(milliseconds: 500);

    drawerAnimationController!.reverse();
    contentAnimationController!.reverse();
  }

  void _forwardAnimationDrawer() {
    drawerAnimationController!.duration = const Duration(milliseconds: 0);
    contentAnimationController!.duration = const Duration(milliseconds: 500);

    drawerAnimationController!.forward();
    contentAnimationController!.forward();
  }

  void toggleMenu() {
    isOpenMenu = !isOpenMenu;
    if (isOpenMenu) {
      _forwardAnimationDrawer();
    } else {
      _reverseAnimationDrawer();
    }
    notifyListeners();
  }
}
