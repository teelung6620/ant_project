import 'package:ant_project/pages/detail_page.dart';
import 'package:flutter/material.dart';

class GuaranteeLayout extends StatelessWidget {
  final String imgPath;
  final String title;
  final String age;
  final String distance;
  final VoidCallback onTap;

  const GuaranteeLayout({
    super.key,
    required this.imgPath,
    required this.title,
    required this.age,
    required this.distance,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 340,
          height: 159,
          //shadowColor: Colors.black,
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(10.0), // ปรับตามที่คุณต้องการ
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 2,
                offset: Offset(1, 2), // การปรับตำแหน่งแสงเงา
              ),
            ],
          ),
          child: Row(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                child: Image.asset(
                  imgPath,
                  width: MediaQuery.of(context).size.width * 0.2,

                  fit: BoxFit.cover, // หรือ BoxFit.fill ขึ้นอยู่กับความต้องการ
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.02,
                    ),
                    const Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'สวัสดิการประกันกลุ่ม คุ้มครองครบ จบใน\nแผนเดียว เพื่อพนักงานคนสำคัญของคุณ',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 113, 113, 113),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ช่วงอายุผู้ขอเอาประกันภัย',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                            Text(
                              age,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                              softWrap: true,
                            ),
                          ],
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ระยะเวลาคุ้มครอง',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                            Text(
                              distance,
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
