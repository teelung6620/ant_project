import 'package:ant_project/src/features/user/flexpoint/presentations/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class CircleChart extends StatelessWidget {
  final String imgPath;
  final String title;
  final String location;
  final String date;
  final String totalPrice;
  final VoidCallback onTap;

  const CircleChart({
    super.key,
    required this.imgPath,
    required this.title,
    required this.location,
    required this.date,
    required this.totalPrice,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      //  child: PieChart(dataMap: dataMap)
    );
  }
}
