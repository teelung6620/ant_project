import 'package:ant_project/presentation/widget/insurance_list.dart';
import 'package:flutter/material.dart';

class InsuranceLayout extends StatelessWidget {
  const InsuranceLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          InsuranceList(title: '2,600', imgPath: 'assets/images/aia.jpg'),
          InsuranceList(title: '4,200', imgPath: 'assets/images/aia.jpg'),
        ],
      ),
    );
  }
}
