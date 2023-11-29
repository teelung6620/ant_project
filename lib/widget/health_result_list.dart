import 'package:ant_project/pages/flexpoint_bag.dart';
import 'package:ant_project/widget/circle_icon2.dart';
import 'package:ant_project/widget/employee.dart';
import 'package:ant_project/widget/health_result.dart';
import 'package:flutter/material.dart';

class HealthResultList extends StatelessWidget {
  const HealthResultList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HealthResult(
                imgPath: 'assets/images/background_img.png',
                title: 'ผลตรวจเม็ดเลือด',
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.01,
              ),
              HealthResult(
                imgPath: 'assets/images/cat.jpg',
                title: 'ผลตรวจระดับน้ำตาล\nในเลือด',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HealthResult(
                imgPath: 'assets/images/cat.jpg',
                title: 'ผลตรวจระดับไขมัน\nคลอเรสเตอร์รอล',
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.01,
              ),
              HealthResult(
                imgPath: 'assets/images/cat.jpg',
                title: 'ผลตรวจสุขภาพ\nการทำงานของตับ',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HealthResult(
                imgPath: 'assets/images/cat.jpg',
                title: 'ผลตรวจสุขภาพ\nการทำงานของไต',
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.01,
              ),
              HealthResult(
                imgPath: 'assets/images/cat.jpg',
                title: 'ผลตรวจสุขภาพ\nกรดยูริก',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
