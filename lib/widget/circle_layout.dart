import 'package:ant_project/pages/flexpoint_bag.dart';
import 'package:ant_project/widget/circle_icon2.dart';
import 'package:flutter/material.dart';

class CircleLayout extends StatelessWidget {
  const CircleLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Column(
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
                title: 'แลก flexpoint',
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
                title: 'ประวัติ flexpoint',
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
            children: [
              CircleIcon(
                title: 'สิทธิของฉัน',
                imgPath: 'assets/images/pink_mileage.png',
                onTap: () {},
              ),
              CircleIcon(
                title: 'แพ็คเกจ\nตรวจสุขภาพ',
                imgPath: 'assets/images/pink_mileage.png',
                onTap: () {},
              ),
            ],
          ),
          Column(
            children: [
              CircleIcon(
                title: 'ซื้อประกัน',
                imgPath: 'assets/images/pink_mileage.png',
                onTap: () {},
              ),
              CircleIcon(
                title: 'แพ็คเกจตรวจสุขภาพ',
                imgPath: 'assets/images/pink_mileage.png',
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
