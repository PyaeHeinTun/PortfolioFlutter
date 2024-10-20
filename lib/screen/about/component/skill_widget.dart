import 'package:flutter/material.dart';
import 'package:portfolio_web/my_data.dart';
import 'package:portfolio_web/screen/about/component/skill_item_widget.dart';

class SkillWidget extends StatelessWidget {
  const SkillWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<SkillData> skillData = myData['about_content']['skill_list'];
    return Column(
      children: buildSkill(skillData, context),
    );
  }
}

List<Widget> buildSkill(List<SkillData> skillDatas, BuildContext context) {
  List<Widget> rowWidget = [];

  for (var i = 0; i < skillDatas.length; i++) {
    rowWidget.add(
      SkillItemWidget(
        skillData: skillDatas[i],
      ),
    );
  }

  return rowWidget;
}

class SkillData {
  final String name;
  final double percent;

  SkillData({
    required this.name,
    required this.percent,
  });
}
