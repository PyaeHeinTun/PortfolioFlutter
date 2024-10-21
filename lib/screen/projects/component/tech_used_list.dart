import 'package:flutter/material.dart';
import 'package:portfolio_web/my_data.dart';
import 'package:portfolio_web/screen/projects/component/project_content.dart';

class TechUsedList extends StatelessWidget {
  const TechUsedList({
    super.key,
    required this.projectData,
  });

  final ProjectData projectData;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 10,
      children: buildTechUsed(projectData),
    );
  }
}

List<Widget> buildTechUsed(ProjectData projectData) {
  List<Widget> widgetList = [];
  List<String> techList = projectData.usedTech;

  for (var i = 0; i < techList.length; i++) {
    if (i == techList.length - 1) {
      widgetList.add(
        Text(
          "#${techList[i]}",
          style: TextStyle(
            color: myData['colors']['primary_color'],
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else {
      widgetList.add(
        Text(
          "#${techList[i]},",
          style: TextStyle(
            color: myData['colors']['primary_color'],
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
  }

  return widgetList;
}
