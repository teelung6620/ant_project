import 'package:ant_project/widget/AppBarCustom.dart';
import 'package:ant_project/widget/button_exchange_bag.dart';
import 'package:ant_project/widget/employee.dart';
import 'package:ant_project/widget/employee_layout.dart';
import 'package:ant_project/widget/guarantee_list.dart';
import 'package:ant_project/widget/health_package_list.dart';
import 'package:ant_project/widget/privileges_2.dart';
import 'package:ant_project/widget/silver_appbar.dart';
import 'package:ant_project/widget/silver_appbar_tabbar.dart';
import 'package:ant_project/widget/total_credit.dart';

import 'package:flutter/material.dart';
import 'package:iconamoon/iconamoon.dart';

class GuaranteePage extends StatefulWidget {
  const GuaranteePage({Key? key}) : super(key: key);

  @override
  State<GuaranteePage> createState() => _GuaranteeState();
}

class _GuaranteeState extends State<GuaranteePage> {
  @override
  Widget build(BuildContext context) {
    double rightValue = MediaQuery.of(context).size.width * 0.03;
    double bottomValue = MediaQuery.of(context).size.width * 0.1;
    return DefaultTabController(
        length: 5, // จำนวน Tab ทั้งหมด
        child: Scaffold(
          appBar: AppBar(
            leadingWidth: 200,
            leading: AppBarCustom(
              title: 'ซื้อประกัน',
            ),
            // automaticallyImplyLeading: false,
            // title: const Text(
            //   ('แลก Flexpoint'),
            //   style: TextStyle(fontSize: 20),
            // ),
            //centerTitle: true,
            // backgroundColor: Color(0xFF363062),
            toolbarHeight: MediaQuery.of(context).size.height * 0.23,
            flexibleSpace: Stack(
              children: [
                Positioned(
                  right: 0,
                  left: 0,
                  child: Image.asset(
                    'assets/images/Group 723.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
            bottom: const TabBar(
              isScrollable: true,
              tabs: [
                Tab(
                  text: 'ทั้งหมด',
                ),
                Tab(
                  text: 'ประกันกลุ่ม',
                ),
                Tab(
                  text: 'ประกันบุคคล',
                ),
                Tab(
                  text: 'ประกันอุบัติเหตุ',
                ),
                Tab(
                  text: 'ประกันชีวิต',
                ),
              ],
              indicatorColor: Colors.pink,
              labelColor: Colors.pink,
            ),
          ),
          body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBarView(children: [
                Container(
                  child: const SingleChildScrollView(
                    child: Column(
                      children: [GuaranteeList()],
                    ),
                  ),
                ),
                Container(
                  child: const SingleChildScrollView(
                    child: Column(
                      children: [GuaranteeList()],
                    ),
                  ),
                ),
                Container(
                  child: const SingleChildScrollView(
                    child: Column(
                      children: [GuaranteeList()],
                    ),
                  ),
                ),
                Container(
                  child: const SingleChildScrollView(
                    child: Column(
                      children: [GuaranteeList()],
                    ),
                  ),
                ),
                Container(
                  child: const SingleChildScrollView(
                    child: Column(
                      children: [GuaranteeList()],
                    ),
                  ),
                ),
              ])),
        ));
  }
}
