import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_web/my_data.dart';
import 'package:portfolio_web/screen/projects/component/project_content.dart';

class ProjectTitle extends StatelessWidget {
  const ProjectTitle({
    super.key,
    required this.projectData,
  });

  final ProjectData projectData;

  @override
  Widget build(BuildContext context) {
    return Text(
      projectData.projectName,
      style: GoogleFonts.akatab(
        color: myData['colors']['text_color'],
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
