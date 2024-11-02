import 'package:flutter/material.dart';
import 'package:portfolio_web/shared_component/decide_screen_type.dart';

class MenuDrawerController extends ChangeNotifier {
  int selectedMenuIndex = 0;
  bool isOpenMenu = false;
  bool isMenuLoading = false;
  ScreenType? screenType;

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

  void setScreenType(double width) {
    if (DecideScreenType.decide(width) == ScreenType.small) {
      screenType = ScreenType.small;
    }

    if (DecideScreenType.decide(width) == ScreenType.large) {
      screenType = ScreenType.large;
    }
  }

  void _reverseAnimationDrawer() {
    drawerAnimationController!.duration = const Duration(milliseconds: 150);
    contentAnimationController!.duration = const Duration(milliseconds: 100);

    drawerAnimationController!.reverse().then((_) {
      isMenuLoading = false;
      notifyAgain();
    });
    contentAnimationController!.reverse().then((_) {
      isMenuLoading = false;
      notifyAgain();
    });
  }

  void _forwardAnimationDrawer() {
    drawerAnimationController!.duration = const Duration(milliseconds: 0);
    contentAnimationController!.duration = const Duration(milliseconds: 100);

    drawerAnimationController!.forward().then((_) {
      isMenuLoading = false;
      notifyAgain();
    });
    contentAnimationController!.forward().then((_) {
      isMenuLoading = false;
      notifyAgain();
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
