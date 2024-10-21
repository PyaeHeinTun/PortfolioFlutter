import 'package:flutter/material.dart';
import 'package:portfolio_web/controller/menu_controller.dart';
import 'package:portfolio_web/my_data.dart';
import 'package:portfolio_web/screen/about/component/education_item_widget.dart';
import 'package:provider/provider.dart';

class EducationWidget extends StatefulWidget {
  const EducationWidget({super.key});

  @override
  State<EducationWidget> createState() => _EducationWidgetState();
}

class _EducationWidgetState extends State<EducationWidget> {
  GlobalKey listKey = GlobalKey();

  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   setState(() {});
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Text Section
        Column(
          key: listKey,
          children: buildEducation(context),
        ),

        // Vertical Line
        Consumer<MenuDrawerController>(builder: (context, menuController, _) {
          return buildVerticalLine(listKey);
        }),
      ],
    );
  }
}

List<Widget> buildEducation(BuildContext context) {
  List<EducationData> dataList = myData['about_content']['education_list'];
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

Widget buildVerticalLine(GlobalKey listKey) {
  if (listKey.currentContext != null) {
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
