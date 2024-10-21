import 'package:flutter/material.dart';
import 'package:portfolio_web/my_data.dart';
import 'package:portfolio_web/screen/projects/component/project_content.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectButtons extends StatelessWidget {
  const ProjectButtons({
    super.key,
    required this.projectData,
  });

  final ProjectData projectData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: myData['colors']['menu_color'],
          child: IconButton(
            icon: Icon(
              Icons.open_in_new,
              color: myData['colors']['text_color'],
              size: 30,
            ),
            onPressed: () async {
              final Uri url = Uri.parse(projectData.demoLink);
              if (!await launchUrl(url)) {
                throw Exception('Could not launch $url');
              }
            },
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        CircleAvatar(
          radius: 30,
          backgroundColor: myData['colors']['menu_color'],
          child: IconButton(
            icon: Icon(
              Icons.code,
              color: myData['colors']['text_color'],
              size: 30,
            ),
            onPressed: () async {
              final Uri url = Uri.parse(projectData.sourceCode);
              if (!await launchUrl(url)) {
                throw Exception('Could not launch $url');
              }
            },
          ),
        ),
      ],
    );
  }
}
