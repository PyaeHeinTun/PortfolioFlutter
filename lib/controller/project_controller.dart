import 'package:flutter/material.dart';
import 'package:portfolio_web/my_data.dart';

class ProjectController extends ChangeNotifier {
  int currentPageIndex = 0;
  int projectListLength = myData['project_content'].length;

  void changePageIndexNext() {
    if (currentPageIndex < projectListLength - 1) {
      currentPageIndex++;
      notifyListeners();
    }
  }

  void changePageIndexPrevious() {
    if (currentPageIndex > 0) {
      currentPageIndex--;
      notifyListeners();
    }
  }
}
