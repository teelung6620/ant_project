import 'package:ant_project/pages/flexpoint_bag.dart';
import 'package:ant_project/widget/circle_icon2.dart';
import 'package:ant_project/widget/employee.dart';
import 'package:flutter/material.dart';

class EmployeeLayout extends StatelessWidget {
  const EmployeeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          children: [
            Employee(
              imgPath: 'assets/images/cat.jpg',
              title: 'title',
              title2: 'ds',
            ),
            SizedBox(
              width: MediaQuery.of(context).size.height * 0.02,
            ),
            Employee(
              imgPath: 'assets/images/cat.jpg',
              title: 'title',
              title2: 'ds',
            ),
            SizedBox(
              width: MediaQuery.of(context).size.height * 0.02,
            ),
            Employee(
              imgPath: 'assets/images/cat.jpg',
              title: 'title',
              title2: 'ds',
            ),
            SizedBox(
              width: MediaQuery.of(context).size.height * 0.02,
            ),
            Employee(
              imgPath: 'assets/images/cat.jpg',
              title: 'title',
              title2: 'ds',
            ),
            SizedBox(
              width: MediaQuery.of(context).size.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
