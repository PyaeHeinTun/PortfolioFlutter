import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_web/my_data.dart';
import 'package:portfolio_web/screen/about/component/info_widget.dart';

class InfoItemWidget extends StatelessWidget {
  const InfoItemWidget({
    super.key,
    required this.infoData,
  });

  final InfoData infoData;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${infoData.name} :",
          style: GoogleFonts.afacad(
            color: myData['colors']['text_color'],
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          infoData.data,
          style: GoogleFonts.afacad(
            color: myData['colors']['text_color'],
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: (MediaQuery.of(context).size.width / 2) - 50,
          height: 3,
          decoration: BoxDecoration(
            color: myData['colors']['text_color'].withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
