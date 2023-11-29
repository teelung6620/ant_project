import 'package:ant_project/pages/detail_page.dart';
import 'package:flutter/material.dart';

class HealthPackage extends StatelessWidget {
  final String imgPath;
  final String title;
  final String describ;
  final String price;

  const HealthPackage({
    super.key,
    required this.imgPath,
    required this.title,
    required this.describ,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () async {},
        child: Container(
          width: 330,
          height: 180,
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
                width: 20,
              ),
              Container(
                child: Center(
                  child: Image.asset(
                    imgPath,
                    width: MediaQuery.of(context).size.width * 0.25,

                    fit:
                        BoxFit.cover, // หรือ BoxFit.fill ขึ้นอยู่กับความต้องการ
                  ),
                ),
              ),
              Spacer(),
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
                    Text(
                      describ,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      softWrap: true,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.02,
                    ),
                    const Row(
                      children: [
                        Text(
                          'สิ้นสุด : 30 Nov 2023',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 113, 113, 113),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Row(
                      children: [
                        Text(
                          'ราคา ',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 113, 113, 113),
                          ),
                        ),
                        Text(
                          price,
                          style: TextStyle(
                            fontSize: 13,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        Text(
                          ' บาท',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 113, 113, 113),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      height: 20,
                      width: 130,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF7697),
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          // ตอบสนองเมื่อปุ่มถูกกด
                        },
                        child: const Text(
                          'จอง',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
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
