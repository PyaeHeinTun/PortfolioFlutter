import 'package:flutter/material.dart';
import 'package:portfolio_web/my_data.dart';
import 'package:portfolio_web/screen/about/component/info_item_widget.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<InfoData> infoList = myData['about_content']['info_list'];

    return Column(
      children: buildInfo(infoList, context),
    );
  }
}

List<Widget> buildInfo(List<InfoData> infoList, BuildContext context) {
  List<Widget> rowWidget = [];

  rowWidget.add(
    const SizedBox(
      height: 40,
    ),
  );

  for (var i = 0; i < infoList.length; i++) {
    if (i % 2 == 0) {
      rowWidget.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: InfoItemWidget(
                  infoData: infoList[i],
                ),
              ),
            ),
            Flexible(
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: InfoItemWidget(
                  infoData: infoList[i + 1],
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  return rowWidget;
}

class InfoData {
  final String name;
  final String data;

  InfoData({
    required this.name,
    required this.data,
  });
}
