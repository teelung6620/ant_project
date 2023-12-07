import 'package:ant_project/presentation/widget/AppBarCustom.dart';
import 'package:ant_project/presentation/widget/button_exchange_bag.dart';
import 'package:ant_project/presentation/widget/employee.dart';
import 'package:ant_project/presentation/widget/employee_layout.dart';
import 'package:ant_project/presentation/widget/guarantee_list.dart';
import 'package:ant_project/presentation/widget/health_package_list.dart';
import 'package:ant_project/presentation/widget/medical_treatment_layout.dart';
import 'package:ant_project/presentation/widget/privileges_2.dart';
import 'package:ant_project/presentation/widget/silver_appbar.dart';
import 'package:ant_project/presentation/widget/silver_appbar_tabbar.dart';
import 'package:ant_project/presentation/widget/total_credit.dart';

import 'package:flutter/material.dart';
import 'package:iconamoon/iconamoon.dart';

class MedicalTreatmentPage extends StatefulWidget {
  const MedicalTreatmentPage({Key? key}) : super(key: key);

  @override
  State<MedicalTreatmentPage> createState() => _MedicalTreatmentState();
}

class _MedicalTreatmentState extends State<MedicalTreatmentPage> {
  @override
  Widget build(BuildContext context) {
    String dropdownvalue = '2566';
    var items = [
      '2560',
      '2561',
      '2562',
      '2563',
      '2564',
      '2565',
      '2566',
    ];
    // double rightValue = MediaQuery.of(context).size.width * 0.03;
    // double bottomValue = MediaQuery.of(context).size.width * 0.1;
    return DefaultTabController(
        length: 4, // จำนวน Tab ทั้งหมด
        child: Scaffold(
          appBar: AppBar(
            leadingWidth: 250,
            leading: AppBarCustom(
              title: 'ประวัติการรักษาพยาบาล',
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
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: Row(
                children: [
                  TabBar(
                    isScrollable: true,
                    tabs: [
                      Tab(
                        text: 'ทั้งหมด',
                      ),
                      Tab(
                        text: 'OPD',
                      ),
                      Tab(
                        text: 'IPD',
                      ),
                      Tab(
                        text: 'Dental',
                      ),
                    ],
                    indicatorColor: Colors.pink,
                    labelColor: Colors.pink, tabAlignment: TabAlignment.start,
                    //indicatorSize: TabBarIndicatorSize.label,
                  ),
                  Spacer(),
                  Container(
                    height: 30.0, // Adjust the height as needed
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(
                        color: Color(0xFFEC5B7E), // Change color as needed
                        width: 2.0,
                      ),
                    ),
                    child: Center(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          borderRadius: BorderRadius.circular(10),
                          value: dropdownvalue,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Color(0xFFEC5B7E),
                          ),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                                style: TextStyle(
                                  color: Color(0xFFEC5B7E),
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.09),
                ],
              ),
            ),
          ),
          body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBarView(children: [
                Container(
                  child: const SingleChildScrollView(
                    child: Column(
                      children: [MedicalTreatmentLayout()],
                    ),
                  ),
                ),
                Container(
                  child: const SingleChildScrollView(
                    child: Column(
                      children: [MedicalTreatmentLayout()],
                    ),
                  ),
                ),
                Container(
                  child: const SingleChildScrollView(
                    child: Column(
                      children: [MedicalTreatmentLayout()],
                    ),
                  ),
                ),
                Container(
                  child: const SingleChildScrollView(
                    child: Column(
                      children: [MedicalTreatmentLayout()],
                    ),
                  ),
                ),
              ])),
        ));
  }
}
