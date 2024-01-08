import 'package:ant_project/src/features/user/flexpoint/presentations/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class MedicalTreatment extends StatelessWidget {
  final String? imgPath;
  final String? title;
  final String? location;
  final String? date;
  final String? category;
  final String? totalPrice;
  final VoidCallback onTap;

  const MedicalTreatment({
    super.key,
    required this.imgPath,
    required this.category,
    required this.title,
    required this.location,
    required this.date,
    required this.totalPrice,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 324,
          height: 140,
          //shadowColor: Colors.black,
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(10.0), // ปรับตามที่คุณต้องการ
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 5.0,
                offset: Offset(1, 2), // การปรับตำแหน่งแสงเงา
              ),
            ],
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                        flex: 1,
                        child: ClipOval(
                          child: imgPath != ''
                              ? SvgPicture.asset(
                                  imgPath.toString(),
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  fit: BoxFit.contain,
                                )
                              : Icon(
                                  Icons.person, // เลือก icon ที่ต้องการแสดง
                                  size:
                                      MediaQuery.of(context).size.height * 0.1,
                                  color: Colors.black, // เลือกสีของ icon
                                ),
                        )),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Image.asset(
                          //   imgPath,
                          //   width: MediaQuery.of(context).size.width * 0.15,

                          //   fit: BoxFit
                          //       .cover, // หรือ BoxFit.fill ขึ้นอยู่กับความต้องการ
                          // ),
                          Text(
                            category == '1'
                                ? 'OPD'
                                : category == '2'
                                    ? 'IPD'
                                    : category == '3'
                                        ? 'DENTAL'
                                        : 'ไม่ทราบสถานะ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: category == '1'
                                  ? Colors.blue
                                  : category == '2'
                                      ? Colors.red
                                      : category == '3'
                                          ? Colors.green
                                          : Colors
                                              .black, // สีเริ่มต้นหากไม่ตรงกับเงื่อนไขใด ๆ
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Text(
                            'สถานที่ :',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 113, 113, 113),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.005,
                          ),
                          Text(
                            'วันที่ :',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 113, 113, 113),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.005,
                          ),
                          Text(
                            'รวมเบิก :',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 113, 113, 113),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title.toString(),
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Text(
                            location.toString(),
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.005,
                          ),
                          Text(
                            date.toString(),
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.005,
                          ),
                          Text(
                            '${NumberFormat('#,###').format(int.parse(totalPrice.toString()))} บาท',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
