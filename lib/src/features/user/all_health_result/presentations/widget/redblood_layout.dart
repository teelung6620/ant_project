import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RedbloodLayout extends StatelessWidget {
  final String imgPath;
  final String section;
  final String value;
  final String unit;
  final String standard;
  final String status;

  RedbloodLayout({
    super.key,
    required this.imgPath,
    required this.section,
    required this.value,
    required this.unit,
    required this.standard,
    required this.status,
  });
  final List<Color> gradientColor = [
    Color.fromARGB(255, 255, 158, 247),
    Color.fromARGB(255, 255, 142, 182)
  ];
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Column(
                children: [
                  Text(section),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: LineChart(LineChartData(
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: SideTitles(
                            showTitles: true,
                            getTitles: (value) {
                              switch (value.toInt()) {
                                case 1:
                                  return '2019';
                                case 3:
                                  return '2020';
                                case 5:
                                  return '2021';
                                case 7:
                                  return '2022';
                                case 9:
                                  return '2023';
                              }
                              return '';
                            },
                            margin: 10,
                            interval: 1,
                            reservedSize: 20,
                            getTextStyles: (context, value) => const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          leftTitles: SideTitles(
                            showTitles: true,
                            getTitles: (value) {
                              // แสดงเฉพาะค่าจำนวนเต็ม 1-3
                              if (value == 1 || value == 2 || value == 3) {
                                return value.toInt().toString();
                              }
                              return '';
                            },
                            margin: 10,
                            interval: 1,
                            reservedSize: 20,
                            getTextStyles: (context, value) => const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          rightTitles: SideTitles(
                            showTitles: true,
                            getTitles: (value) {
                              if (value == 1) {
                                return '';
                              } else if (value == 2) {
                                return '';
                              } else if (value == 3) {
                                return '';
                              }
                              return ''; // ถ้าไม่ตรงกับเงื่อนไขใด ๆ ให้ส่งคืน SizedBox เพื่อไม่แสดงอะไรเลย
                            },
                            margin: 10,
                            interval: 1,
                            reservedSize: 20,
                            getTextStyles: (context, value) => const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          topTitles: SideTitles(showTitles: false),
                        ),
                        lineBarsData: [
                          LineChartBarData(
                              spots: [
                                FlSpot(1, 1),
                                FlSpot(3, double.tryParse(status) ?? 0.0),
                                FlSpot(5, 3),
                                FlSpot(7, 1),
                                FlSpot(9, 2),
                              ],
                              isCurved: true,
                              barWidth: 2,
                              dotData: FlDotData(
                                show: false,
                              ),
                              colors: gradientColor,
                              belowBarData: BarAreaData(
                                  show: true,
                                  colors: gradientColor
                                      .map((color) => color.withOpacity(0.4))
                                      .toList())),
                        ],
                        minX: 1,
                        maxX: 9,
                        minY: 0,
                        maxY: 4,
                        // backgroundColor: const Color.fromARGB(
                        //     255, 5, 37, 64), // สีพื้นหลังที่คุณต้องการ
                      ))),
                ],
              ),
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 180,
          height: 180,
          //shadowColor: Colors.black,
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(10.0), // ปรับตามที่คุณต้องการ
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(-1, 2), // การปรับตำแหน่งแสงเงา
              ),
            ],
          ),

          // elevation: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 6.0, bottom: 2.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8, bottom: 5),
                        child: Row(
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  section,
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 126, 126, 126)),
                                )),
                          ],
                        ),
                      ),
                      SvgPicture.asset(
                        imgPath,
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover, // ให้รูปทำการ fit ใน CircleAvatar
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        value + ' ' + unit,
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        standard,
                        style: TextStyle(
                            fontSize: 13,
                            color: const Color.fromARGB(255, 108, 108, 108)),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        status == '1'
                            ? 'อยู่ในเกณฑ์มาตรฐาน'
                            : status == '2'
                                ? 'อยู่ในเกณฑ์เสี่ยงมาตรฐาน'
                                : status == '3'
                                    ? 'ไม่อยู่ในเกณฑ์มาตรฐาน'
                                    : 'ไม่ทราบสถานะ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: status == '1'
                              ? Color.fromARGB(255, 0, 156, 5)
                              : status == '2'
                                  ? Color.fromARGB(255, 246, 208, 19)
                                  : status == '3'
                                      ? Colors.red
                                      : Colors
                                          .black, // สีเริ่มต้นหากไม่ตรงกับเงื่อนไขใด ๆ
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
