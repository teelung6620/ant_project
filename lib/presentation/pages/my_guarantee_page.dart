import 'package:ant_project/presentation/widget/AppBarCustom.dart';
import 'package:ant_project/presentation/widget/AppBarCustom2.dart';
import 'package:ant_project/presentation/widget/employee.dart';
import 'package:ant_project/presentation/widget/employee_layout.dart';
import 'package:ant_project/presentation/widget/privileges_2.dart';
import 'package:ant_project/presentation/widget/silver_appbar.dart';
import 'package:ant_project/presentation/widget/total_credit.dart';

import 'package:flutter/material.dart';
import 'package:iconamoon/iconamoon.dart';

class MyGuaranteePage extends StatefulWidget {
  const MyGuaranteePage({Key? key}) : super(key: key);
  @override
  State<MyGuaranteePage> createState() => _MyGuaranteeState();
}

class _MyGuaranteeState extends State<MyGuaranteePage> {
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

          child: Column(children: [
            AppBarCustom2(
                title: 'ประกันของฉัน',
                imgPath: 'assets/images/Group 727.png',
                showBackButton: true),
            EmployeeLayout(),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * 0.09),
                Text(
                  'ประกัน',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            //Image.asset('assets/images/coin_privi.png'),
          ]),

          // Your other widgets or content goes here
        ),
      ),
    );
  }
}
