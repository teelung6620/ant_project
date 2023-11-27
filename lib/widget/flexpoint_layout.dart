import 'package:ant_project/widget/flexpoint_list.dart';
import 'package:flutter/material.dart';

class FlexpointLayout extends StatelessWidget {
  const FlexpointLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FlexpointList(
              title: 'หม้อทอดไร้น้ำมัน', imgPath: 'assets/images/11.jpg'),
          FlexpointList(
              title: 'หม้อทอดไร้น้ำมัน', imgPath: 'assets/images/11.jpg'),
        ],
      ),
    );
  }
}
