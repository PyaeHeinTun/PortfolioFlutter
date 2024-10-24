import 'package:flutter/material.dart';
import 'package:portfolio_web/controller/menu_controller.dart';
import 'package:portfolio_web/my_data.dart';
import 'package:portfolio_web/screen/about/component/education_item_widget.dart';
import 'package:provider/provider.dart';

enum EducationType {
  education,
  workHistory,
}

class EducationWidget extends StatefulWidget {
  const EducationWidget({
    super.key,
    required this.isEducation,
  });

  final bool isEducation;

  @override
  State<EducationWidget> createState() => _EducationWidgetState();
}

class _EducationWidgetState extends State<EducationWidget> {
  GlobalKey listKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Text Section
        Column(
          key: listKey,
          children: buildEducation(
            context: context,
            isEducation: widget.isEducation,
          ),
        ),

        // Vertical Line
        Consumer<MenuDrawerController>(builder: (context, menuController, _) {
          return buildVerticalLine(listKey, context);
        }),
      ],
    );
  }
}

List<Widget> buildEducation({
  @required BuildContext? context,
  @required bool? isEducation,
}) {
  List<EducationData> dataList;
  if (isEducation != null && isEducation) {
    dataList = myData['about_content']['education_list'];
  } else {
    dataList = myData['about_content']['workHistory_list'];
  }
  List<Widget> widgetList = [];

  for (var i = 0; i < dataList.length; i++) {
    widgetList.add(
      Container(
        margin: const EdgeInsets.only(top: 20),
        child: EducationItemWidget(
          educationData: dataList[i],
        ),
      ),
    );
  }
  return widgetList;
}

Widget buildVerticalLine(GlobalKey listKey, BuildContext context) {
  if (listKey.currentContext != null) {
    try {
      listKey.currentContext!.findRenderObject()!.paintBounds;
      Provider.of<MenuDrawerController>(context, listen: false).notifyAgain();

      final box = listKey.currentContext!.findRenderObject() as RenderBox;

      return Container(
        margin: const EdgeInsets.only(
          left: 8,
          top: 20,
        ),
        height: box.size.height,
        width: 4,
        decoration: BoxDecoration(
          color: myData['colors']['primary_color'],
          borderRadius: BorderRadius.circular(20),
        ),
      );
    } catch (e) {
      // ignore: avoid_print
      print("object");
    }
  }
  return const SizedBox();
}

class EducationData {
  final String year;
  final String name;
  final String description;

  EducationData({
    required this.year,
    required this.name,
    required this.description,
  });
}
