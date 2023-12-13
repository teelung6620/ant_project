import 'package:ant_project/presentation/widget/guarantee_layout.dart';
import 'package:ant_project/presentation/widget/medical_treatment.dart';
import 'package:flutter/material.dart';

class MedicalTreatmentLayout extends StatelessWidget {
  const MedicalTreatmentLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MedicalTreatment(
            title: 'ปวดหัว เป็นไข้หวัดใหญ่',
            imgPath: 'assets/images/IPD.png',
            location: 'โรงพยาบาลพญาไท 2',
            date: '15 ต.ค. 66',
            totalPrice: '96,000',
            onTap: () {},
          ),
          MedicalTreatment(
            title: 'ไอ เจ็บคอ',
            imgPath: 'assets/images/OPD.png',
            location: 'โรงพยาบาลพญาไท 2',
            date: '15 ต.ค. 66',
            totalPrice: '96,000',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
