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
    )..addListener(() {
        if (drawerAnimationController!.isAnimating) {
          isMenuLoading = true;
        }
        notifyListeners();
      });
    drawerAnimation = Tween<double>(begin: start, end: end)
        .animate(drawerAnimationController!);
  }

  void setUpContentAnimation(
      {required TickerProvider ticker,
      required double start,
      required double end}) {
    contentAnimationController = AnimationController(
      vsync: ticker,
    )..addListener(() {
        if (contentAnimationController!.isAnimating) {
          isMenuLoading = true;
        }
        notifyListeners();
      });
    contentAnimation = Tween<double>(begin: start, end: end)
        .animate(contentAnimationController!);
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
    _reverseAnimationDrawer();
    notifyListeners();
  }

  void _reverseAnimationDrawer() {
    drawerAnimationController!.duration = const Duration(milliseconds: 150);
    contentAnimationController!.duration = const Duration(milliseconds: 100);

    drawerAnimationController!.reverse().then((_) {
      isMenuLoading = false;
    });
    contentAnimationController!.reverse().then((_) {
      isMenuLoading = false;
    });
  }

  void _forwardAnimationDrawer() {
    drawerAnimationController!.duration = const Duration(milliseconds: 0);
    contentAnimationController!.duration = const Duration(milliseconds: 100);

    drawerAnimationController!.forward().then((_) {
      isMenuLoading = false;
    });
    contentAnimationController!.forward().then((_) {
      isMenuLoading = false;
    });
  }

  void notifyAgain() {
    notifyListeners();
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
