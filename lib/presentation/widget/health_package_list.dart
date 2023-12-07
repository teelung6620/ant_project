import 'package:ant_project/presentation/widget/health_package.dart';
import 'package:ant_project/presentation/widget/product_list.dart';
import 'package:flutter/material.dart';

class HealthPackageList extends StatelessWidget {
  const HealthPackageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          HealthPackage(
            title: 'แพ็กเกจตรวจสุขภาพ\nAdvanced Check-Up',
            imgPath: 'assets/images/Rectangle 278.png',
            describ: '(สำหรับผู้หญิง อายุระหว่าง 30 - 40 ปี)',
            price: '10,000',
          ),
          HealthPackage(
            title: 'แพ็กเกจตรวจสุขภาพ\nAdvanced Check-Up',
            imgPath: 'assets/images/Rectangle 278.png',
            describ: '(สำหรับผู้หญิง อายุระหว่าง 30 - 40 ปี)',
            price: '20,000',
          ),
          HealthPackage(
            title: 'แพ็กเกจตรวจสุขภาพ\nAdvanced Check-Up',
            imgPath: 'assets/images/Rectangle 278.png',
            describ: '(สำหรับผู้หญิง อายุระหว่าง 30 - 40 ปี)',
            price: '30,000',
          ),
          HealthPackage(
            title: 'แพ็กเกจตรวจสุขภาพ\nAdvanced Check-Up',
            imgPath: 'assets/images/Rectangle 278.png',
            describ: '(สำหรับผู้หญิง อายุระหว่าง 30 - 40 ปี)',
            price: '30,000',
          ),
          HealthPackage(
            title: 'แพ็กเกจตรวจสุขภาพ\nAdvanced Check-Up',
            imgPath: 'assets/images/Rectangle 278.png',
            describ: '(สำหรับผู้หญิง อายุระหว่าง 30 - 40 ปี)',
            price: '30,000',
          ),
          HealthPackage(
            title: 'แพ็กเกจตรวจสุขภาพ\nAdvanced Check-Up',
            imgPath: 'assets/images/Rectangle 278.png',
            describ: '(สำหรับผู้หญิง อายุระหว่าง 30 - 40 ปี)',
            price: '30,000',
          ),
        ],
      ),
    );
  }
}
