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
        SizedBox(
          height: height,
          child: const ProjectContent(),
        ),

        // Pagination Button
        PaginationButtons(
          callBackFun: () {
            Provider.of<ProjectController>(context, listen: false)
                .changePageIndexPrevious();
          },
          icon: Icons.arrow_back,
          bottom: 20,
          left: 0,
        ),

        PaginationButtons(
          callBackFun: () {
            Provider.of<ProjectController>(context, listen: false)
                .changePageIndexNext();
          },
          icon: Icons.arrow_forward,
          bottom: 20,
          right: 0,
        ),
      ],
    );
  }
}
