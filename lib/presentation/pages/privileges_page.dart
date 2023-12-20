import 'package:ant_project/presentation/widget/AppBarCustom.dart';
import 'package:ant_project/presentation/widget/AppBarCustom2.dart';
import 'package:ant_project/presentation/widget/employee.dart';
import 'package:ant_project/presentation/widget/employee_layout.dart';
import 'package:ant_project/presentation/widget/privileges_2.dart';
import 'package:ant_project/presentation/widget/silver_appbar.dart';
import 'package:ant_project/presentation/widget/total_credit.dart';

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
      // appBar: AppBar(
      //   // automaticallyImplyLeading: false,
      //   leadingWidth: 200,
      //   leading: AppBarCustom(title: 'แลก Flexpoint', showBackButton: false),
      //   //centerTitle: true,
      //   // backgroundColor: Color(0xFF363062),
      //   toolbarHeight: MediaQuery.of(context).size.height * 0.23,
      //   flexibleSpace: Stack(
      //     children: [
      //       Positioned(
      //         right: 0,
      //         left: 0,
      //         child: Image.asset(
      //           'assets/images/Group 725.png',
      //           fit: BoxFit.contain,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Container(
          // height: 488.64, // Adjust the height as needed

          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            AppBarCustom2(
                title: 'สิทธิของฉัน',
                imgPath: 'assets/images/Group 718.png',
                showBackButton: false),
            EmployeeLayout(),
            //Image.asset('assets/images/coin_privi.png'),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * 0.06),
                Text(
                  'สิทธิ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            TotalCredit(
              title: '10,000',
            ),
            Privileges2()
          ]),

          // Your other widgets or content goes here
        ),
      ),
    );
  }
}
