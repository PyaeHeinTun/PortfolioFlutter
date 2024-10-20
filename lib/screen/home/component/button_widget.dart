import 'package:flutter/material.dart';
import 'package:portfolio_web/my_data.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonText;

  const ButtonWidget({
    super.key,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: myData['colors']['primary_color'],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          color: myData['colors']['text_color'],
          fontSize: 18,
        ),
      ),
    );
  }
}