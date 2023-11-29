import 'package:ant_project/pages/flexpoint_bag.dart';
import 'package:ant_project/pages/guarantee_page.dart';
import 'package:ant_project/pages/health_check_page.dart';
import 'package:ant_project/widget/circle_icon2.dart';
import 'package:flutter/material.dart';

class CircleLayout extends StatelessWidget {
  const CircleLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleIcon(
                title: 'กระเป๋า flexpoint',
                imgPath: 'assets/images/pink_mileage.png',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FlexpointBagPage()),
                  );
                },
              ),
              CircleIcon(
                title: 'ประวัติการรักษา',
                imgPath: 'assets/images/pink_mileage.png',
                onTap: () {},
              )
            ],
          ),
          Column(
            children: [
              CircleIcon(
                title: 'แลก\nFlexpoint',
                imgPath: 'assets/images/pink_mileage.png',
                onTap: () {},
              ),
              CircleIcon(
                title: 'Dashboard',
                imgPath: 'assets/images/pink_mileage.png',
                onTap: () {},
              ),
            ],
          ),
          Column(
            children: [
              CircleIcon(
                title: 'ประวัติการแลก\nFlexpoint',
                imgPath: 'assets/images/pink_mileage.png',
                onTap: () {},
              ),
              CircleIcon(
                title: 'ผลสุขภาพ',
                imgPath: 'assets/images/pink_mileage.png',
                onTap: () {},
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleIcon(
                title: 'สิทธิของฉัน',
                imgPath: 'assets/images/pink_mileage.png',
                onTap: () {},
              ),
              CircleIcon(
                title: 'แพ็คเกจ\nตรวจสุขภาพ',
                imgPath: 'assets/images/pink_mileage.png',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HealthCheckPage()),
                  );
                },
              ),
            ],
          ),
          Column(
            children: [
              CircleIcon(
                title: 'ซื้อประกัน',
                imgPath: 'assets/images/pink_mileage.png',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GuaranteePage()),
                  );
                },
              ),
              CircleIcon(
                title: 'Certificate\nสุขภาพ',
                imgPath: 'assets/images/pink_mileage.png',
                onTap: () {},
              ),
            ],
          ),
          CircleIcon(
            title: 'ประกันของฉัน',
            imgPath: 'assets/images/pink_mileage.png',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
