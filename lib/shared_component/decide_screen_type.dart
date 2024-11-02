class DecideScreenType {
  static ScreenType decide(double width) {
    if (width >= 768) {
      return ScreenType.large;
    }
    return ScreenType.small;
  }
}

enum ScreenType {
  small,
  large,
}
