import 'package:flutter/material.dart';

class Employee extends StatelessWidget {
  final String imgPath;
  final String title;
  final String title2;
  const Employee(
      {super.key,
      required this.imgPath,
      required this.title,
      required this.title2});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 132,
          //shadowColor: Colors.black,
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(22.0), // ปรับตามที่คุณต้องการ
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 1,
                offset: Offset(1, 1), // การปรับตำแหน่งแสงเงา
              ),
            ],
          ),

          // elevation: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 50.0, // ความสูงหรือความกว้างของรูปที่คุณต้องการ / 2
                  backgroundColor: Colors.transparent, // ตั้งสีพื้นหลังเป็น透ท
                  child: ClipOval(
                    child: Image.asset(
                      imgPath,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover, // ให้รูปทำการ fit ใน CircleAvatar
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          title2,
                          style: TextStyle(
                            fontSize: 12,
                          ),
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
