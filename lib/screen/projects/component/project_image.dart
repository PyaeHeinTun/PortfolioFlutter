import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_web/my_data.dart';
import 'package:portfolio_web/screen/projects/component/project_content.dart';

class ProjectImage extends StatelessWidget {
  const ProjectImage({
    super.key,
    required this.projectData,
  });

  final ProjectData projectData;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height / 2,
      color: myData['colors']['menu_color'],
      child: CachedNetworkImage(
        fit: BoxFit.contain,
        imageUrl: projectData.img,
        errorWidget: (context, url, error) => Icon(
          Icons.error,
          color: myData['colors']['primary_color'],
          size: width / 3,
        ),
      ),
    );
  }
}
