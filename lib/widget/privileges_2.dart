import 'package:ant_project/widget/insurance_list.dart';
import 'package:ant_project/widget/privileges_list.dart';
import 'package:flutter/material.dart';

class Privileges2 extends StatelessWidget {
  const Privileges2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 70),
      child: Column(
        children: [
          Privileges_list(
            title: 'IPD',
            describe:
                'คุ้มครองครอบคลุมค่าใช้จ่ายต่าง ๆ ที่เกี่ยวข้องกับการรักษา ในโรงพยาบาล เช่น ค่าห้องพัก ค่าอาหาร และค่าบริการต่าง ๆ ',
            price: '10,000',
          ),
          Privileges_list(
            title: 'OPD',
            describe:
                'คุ้มครองครอบคลุมค่าใช้จ่ายต่าง ๆ ที่เกี่ยวข้องกับการรักษา ในโรงพยาบาล เช่น ค่าห้องพัก ค่าอาหาร และค่าบริการต่าง ๆ ',
            price: '35,000',
          ),
          Privileges_list(
            title: 'Dental',
            describe:
                'คุ้มครองครอบคลุมค่าใช้จ่ายต่าง ๆ ที่เกี่ยวข้องกับการรักษา ในโรงพยาบาล เช่น ค่าห้องพัก ค่าอาหาร และค่าบริการต่าง ๆ ',
            price: '5,000',
          ),
        ],
      ),
    );
  }
}
