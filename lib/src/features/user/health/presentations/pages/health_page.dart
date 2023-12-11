import 'package:ant_project/presentation/widget/AppBarCustom2.dart';
import 'package:ant_project/presentation/widget/dropdown_year.dart';
import 'package:ant_project/presentation/widget/silver_appbar.dart';
import 'package:ant_project/src/features/user/health/presentations/widget/health_result_list.dart';
import 'package:flutter/material.dart';

class HealthPage extends StatefulWidget {
  const HealthPage({Key? key}) : super(key: key);

  @override
  State<HealthPage> createState() => _HealthState();
}

class _HealthState extends State<HealthPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 90),
          child: Column(
            children: [
              AppBarCustom2(
                  title: 'ผลสุขภาพ',
                  imgPath: 'assets/images/Group 721.png',
                  showBackButton: false),
              Padding(
                padding: const EdgeInsets.only(right: 50),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
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
                ),
              ),
              HealthResultList(),
            ],
          ),
        ),
      ),
    );
  }
}
