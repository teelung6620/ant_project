import 'package:ant_project/src/features/user/flexpoint/presentations/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HealthPackage extends StatelessWidget {
  final String imgPath;
  final String name;
  final String location;
  final String rating;
  final VoidCallback onTap;

  const HealthPackage({
    super.key,
    required this.imgPath,
    required this.name,
    required this.location,
    required this.rating,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 330,
          height: 150,
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
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ),
              Container(
                child: Center(
                    child: Image.network(
                  imgPath,
                  width: MediaQuery.of(context).size.width * 0.3,
                )),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.05,
              ),
              // Spacer(),
              Container(
                alignment: Alignment.centerLeft,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width * 0.1,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        location,
                        // location.length >
                        //         30 // 50 คือจำนวนตัวอักษรที่คุณต้องการให้แสดง
                        //     ? '${location.substring(0, 30)}...' // ตัดเป็น ... เมื่อยาวเกิน 50 ตัวอักษร
                        //     : location,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        softWrap: true,
                      ),
                    ),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.width * 0.02,
                    // ),
                    // const Row(
                    //   children: [
                    //     Text(
                    //       'สิ้นสุด : 30 Nov 2023',
                    //       style: TextStyle(
                    //         fontSize: 12,
                    //         color: Color.fromARGB(255, 113, 113, 113),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.width * 0.02,
                    // ),

                    RatingBar.builder(
                      initialRating: double.parse(rating),
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 15,
                      itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        // You can use the rating if needed
                      },
                    ),

                    Spacer(),
                    Container(
                      height: 20,
                      width: 80,
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
