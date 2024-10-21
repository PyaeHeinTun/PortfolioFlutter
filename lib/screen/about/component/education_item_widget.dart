import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_web/my_data.dart';
import 'package:portfolio_web/screen/about/component/education_widget.dart';

class EducationItemWidget extends StatelessWidget {
  const EducationItemWidget({
    super.key,
    required this.educationData,
  });

  final EducationData educationData;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: myData['colors']['primary_color'],
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Year
              Row(
                children: [
                  Icon(
                    Icons.import_contacts,
                    color: myData['colors']['text_color'],
                    size: 18,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    educationData.year,
                    style: GoogleFonts.abel(
                      color: myData['colors']['text_color'],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),
              // Name
              Text(
                educationData.name,
                style: GoogleFonts.abel(
                  color: myData['colors']['text_color'],
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              // Description

              SizedBox(
                width: width - 50 - 20 - 20,
                child: Text(
                  educationData.description,
                  style: TextStyle(
                    color: myData['colors']['text_color'],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
