import 'package:flutter/material.dart';
import 'package:portfolio_web/my_data.dart';

class PaginationButtons extends StatelessWidget {
  const PaginationButtons(
      {super.key,
      required this.callBackFun,
      required this.icon,
      this.left,
      this.right,
      this.top,
      this.bottom});

  final VoidCallback callBackFun;
  final IconData icon;
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: ClipRRect(
        child: Material(
          elevation: 10,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          child: InkWell(
            onTap: callBackFun,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: myData['colors']['menu_color'],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                icon,
                color: myData['colors']['primary_color'],
                size: 35,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
