import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_web/my_data.dart';
import 'package:portfolio_web/screen/about/component/skill_widget.dart';

class SkillItemWidget extends StatelessWidget {
  final SkillData skillData;

  const SkillItemWidget({
    super.key,
    required this.skillData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              skillData.name,
              style: GoogleFonts.afacad(
                color: myData['colors']['text_color'],
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${skillData.percent}%",
              style: GoogleFonts.afacad(
                color: myData['colors']['text_color'],
                fontSize: 16,
              ),
            ),
          ],
        ),
        ProgressIndicatorSkill(
          skillData: skillData,
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

class ProgressIndicatorSkill extends StatefulWidget {
  const ProgressIndicatorSkill({
    super.key,
    required this.skillData,
  });

  final SkillData skillData;

  @override
  // ignore: library_private_types_in_public_api
  _ProgressIndicatorSkillState createState() => _ProgressIndicatorSkillState();
}

class _ProgressIndicatorSkillState extends State<ProgressIndicatorSkill>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = Tween<double>(begin: 0.0, end: (widget.skillData.percent) / 100)
        .animate(controller!)
      ..addListener(() {
        setState(() {});
      });
    controller!.forward();
  }

  @override
  void dispose() {
    controller!.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 8,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: LinearProgressIndicator(
          value: animation!.value,
          backgroundColor: myData['colors']['menu_color'],
          color: myData['colors']['primary_color'],
        ),
      ),
    );
  }
}
