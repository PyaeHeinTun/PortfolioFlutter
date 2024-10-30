import 'package:flutter/material.dart';
import 'package:portfolio_web/controller/project_controller.dart';
import 'package:portfolio_web/my_data.dart';
import 'package:portfolio_web/screen/projects/component/project_buttons.dart';
import 'package:portfolio_web/screen/projects/component/project_number.dart';
import 'package:portfolio_web/screen/projects/component/project_title.dart';
import 'package:portfolio_web/screen/projects/component/tech_used_list.dart';
import 'package:portfolio_web/shared_component/description_text.dart';
import 'package:portfolio_web/shared_component/underline.dart';
import 'package:provider/provider.dart';

class ProjectContent extends StatelessWidget {
  const ProjectContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<ProjectController>(
        builder: (context, projectController, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: buildProjectContent(context),
          );
        },
      ),
    );
  }
}

List<Widget> buildProjectContent(BuildContext context) {
  List<Widget> widgetList = [];
  List<ProjectData> projectList = myData['project_content'];

  int currentIndex =
      Provider.of<ProjectController>(context, listen: false).currentPageIndex;

  for (var i = 0; i < projectList.length; i++) {
    if (currentIndex == i) {
      // widgetList.add(const SizedBox(height: 40));
      // widgetList.add(ProjectImage(projectData: projectList[i]));
      widgetList.add(const SizedBox(height: 40));
      widgetList.add(ProjectNumber(projectData: projectList[i]));
      widgetList.add(const SizedBox(height: 40));
      widgetList.add(ProjectTitle(projectData: projectList[i]));
      widgetList.add(const SizedBox(height: 40));
      widgetList.add(DescriptionText(text: projectList[i].projectDescription));
      widgetList.add(const SizedBox(height: 40));
      widgetList.add(TechUsedList(projectData: projectList[i]));
      widgetList.add(const SizedBox(height: 20));
      widgetList.add(const Underline(height: 3));
      widgetList.add(const SizedBox(height: 20));
      widgetList.add(ProjectButtons(projectData: projectList[i]));
      widgetList.add(const SizedBox(height: 40));
    }
  }
  return widgetList;
}

class ProjectData {
  final int index;
  final String projectName;
  final String projectDescription;
  final List<String> usedTech;
  final String img;
  final String sourceCode;
  final String demoLink;

  ProjectData({
    required this.index,
    required this.projectName,
    required this.projectDescription,
    required this.usedTech,
    required this.img,
    required this.sourceCode,
    required this.demoLink,
  });
}
