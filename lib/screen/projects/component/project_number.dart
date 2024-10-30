import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_web/my_data.dart';
import 'package:portfolio_web/screen/projects/component/project_content.dart';

class ProjectNumber extends StatelessWidget {
  const ProjectNumber({
    super.key,
    required this.projectData,
  });

  final ProjectData projectData;

  @override
  Widget build(BuildContext context) {
    return Text(
      "Project #${(projectData.index + 1)}",
      style: GoogleFonts.londrinaSketch(
        color: myData['colors']['text_color'],
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
