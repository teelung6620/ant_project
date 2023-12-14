import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RedbloodLayout extends StatelessWidget {
  final String imgPath;
  final String section;
  final String value;
  final String unit;
  final String standard;
  final String status;

  const RedbloodLayout({
    super.key,
    required this.imgPath,
    required this.section,
    required this.value,
    required this.unit,
    required this.standard,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              section,
                              style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 126, 126, 126)),
                            )),
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
