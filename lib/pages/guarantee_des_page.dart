import 'package:ant_project/widget/AppBarCustom2.dart';
import 'package:ant_project/widget/dropdown_year.dart';
import 'package:ant_project/widget/health_result_list.dart';
import 'package:ant_project/widget/silver_appbar.dart';
import 'package:flutter/material.dart';

class GuaranteeDesPage extends StatefulWidget {
  final String title;
  final String age;
  final String distance;
  const GuaranteeDesPage(
      {Key? key,
      required this.age,
      required this.distance,
      required this.title})
      : super(key: key);

  @override
  State<GuaranteeDesPage> createState() => _GuaranteeDesState();
}

class _GuaranteeDesState extends State<GuaranteeDesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarCustom2(
              title: widget.title,
              imgPath: 'assets/images/Group 726.png',
              showBackButton: true),
          Container(
            width: MediaQuery.of(context).size.width,
            //color: Colors.amber,
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'รายละเอียด',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Text(
                        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                      Divider(),
                      Text(
                        'ความคุ้มครอง',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Text(
                        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                      Divider(),
                      Text(
                        'ระยะเวลาคุ้มครอง',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Text(
                        widget.distance,
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                      Divider(),
                      Text(
                        'ช่วงอายุผู้ขอเอาประกัน',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Text(
                        widget.age,
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                      Divider(),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Text(
                        'รูปแบบประกัน',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015),
                      Container(
                        height: 31,
                        width: 125,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF7697),
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            // ตอบสนองเมื่อปุ่มถูกกด
                          },
                          child: const Text(
                            'ประกันกลุ่ม',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '16,000',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            '  บาท',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.015),
                        ],
                      ),
                    ])),
          ),
        ],
      ),
    );
  }
}
