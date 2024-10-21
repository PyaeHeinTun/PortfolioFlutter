import 'package:flutter/material.dart';
import 'package:portfolio_web/controller/project_controller.dart';
import 'package:portfolio_web/screen/projects/component/pagination_buttons.dart';
import 'package:portfolio_web/screen/projects/component/project_content.dart';
import 'package:provider/provider.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        // Main Content
        const ProjectContent(),

        // Pagination Button
        PaginationButtons(
          callBackFun: () {
            Provider.of<ProjectController>(context, listen: false)
                .changePageIndexPrevious();
          },
          icon: Icons.arrow_back,
          top: height / 1.75,
          left: 0,
        ),

        PaginationButtons(
          callBackFun: () {
            Provider.of<ProjectController>(context, listen: false)
                .changePageIndexNext();
          },
          icon: Icons.arrow_forward,
          top: height / 1.75,
          right: 0,
        ),
      ],
    );
  }
}
