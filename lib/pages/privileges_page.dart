import 'package:ant_project/widget/button_exchange_bag.dart';
import 'package:ant_project/widget/employee.dart';
import 'package:ant_project/widget/employee_layout.dart';
import 'package:ant_project/widget/privileges_2.dart';
import 'package:ant_project/widget/silver_appbar.dart';
import 'package:ant_project/widget/total_credit.dart';

import 'package:flutter/material.dart';
import 'package:iconamoon/iconamoon.dart';

class PrivilegesPage extends StatefulWidget {
  const PrivilegesPage({Key? key}) : super(key: key);
  @override
  State<PrivilegesPage> createState() => _PrivilegesState();
}

class _PrivilegesState extends State<PrivilegesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        AllAppBar(
            title: 'สิทธิของฉัน',
            imgPath: 'assets/images/Group 718.png',
            showBackButton: false),
        SliverToBoxAdapter(
          child: Container(
            // height: 488.64, // Adjust the height as needed

            child: Column(children: [
              EmployeeLayout(),
              //Image.asset('assets/images/coin_privi.png'),
              TotalCredit(
                title: '10,000',
              ),
              Privileges2()
            ]),

            // Your other widgets or content goes here
          ),
        ),
      ],
    ));
  }
}