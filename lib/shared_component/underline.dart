import 'package:flutter/material.dart';
import 'package:portfolio_web/my_data.dart';

class Underline extends StatelessWidget {
  const Underline({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: myData['colors']['text_color'],
      ),
    );
  }
}
