import 'package:ant_project/presentation/widget/AppBarCustom2.dart';
import 'package:ant_project/presentation/widget/dropdown_year.dart';
import 'package:ant_project/presentation/widget/silver_appbar.dart';
import 'package:flutter/material.dart';

class GuaranteeDesPage extends StatefulWidget {
  final String title;
  final String company;
  final String distance;
  final String detail;
  final String imgPath;
  const GuaranteeDesPage(
      {Key? key,
      required this.company,
      required this.distance,
      required this.detail,
      required this.title,
      required this.imgPath})
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
                      Center(
                        child: Image.network(
                          widget.imgPath,
                          width: MediaQuery.of(context).size.width * 0.5,

                          fit: BoxFit
                              .cover, // หรือ BoxFit.fill ขึ้นอยู่กับความต้องการ
                        ),
                      ),
                      const Text(
                        'รายละเอียด',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Text(
                        widget.detail,
                        style:
                            const TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                      const Divider(),
                      const Text(
                        'ความคุ้มครอง',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      const Text(
                        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                      const Divider(),
                      const Text(
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
                      const Divider(),
                      const Text(
                        'ช่วงอายุผู้ขอเอาประกัน',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Text(
                        widget.company,
                        style:
                            const TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                      Divider(),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      const Text(
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
                          const Text(
                            '16,000',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const Text(
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
