import 'package:ant_project/widget/AppBarCustom2.dart';
import 'package:ant_project/widget/button_exchange_bag.dart';
import 'package:ant_project/widget/employee.dart';
import 'package:ant_project/widget/employee_layout.dart';
import 'package:ant_project/widget/health_package_list.dart';
import 'package:ant_project/widget/privileges_2.dart';
import 'package:ant_project/widget/silver_appbar.dart';
import 'package:ant_project/widget/total_credit.dart';

import 'package:flutter/material.dart';
import 'package:iconamoon/iconamoon.dart';

class HealthCheckPage extends StatefulWidget {
  const HealthCheckPage({Key? key}) : super(key: key);
  @override
  State<HealthCheckPage> createState() => _HealthCheckState();
}

class _HealthCheckState extends State<HealthCheckPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // height: 488.64, // Adjust the height as needed

          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            AppBarCustom2(
                title: 'สิทธิของฉัน',
                imgPath: 'assets/images/Group 721.png',
                showBackButton: true),
            HealthPackageList(),
            //Image.asset('assets/images/coin_privi.png'),
          ]),

          // Your other widgets or content goes here
        ),
      ),
    );
  }
}
