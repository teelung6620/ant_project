import 'package:flutter/material.dart';

class InsuranceList extends StatelessWidget {
  final String imgPath;
  final String title;
  const InsuranceList({super.key, required this.imgPath, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image.asset(
                imgPath,
                width: 250,
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ประกัน',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'รายละเอียดประกัน',
                        style: TextStyle(
                          fontSize: 12,
                          color: const Color.fromARGB(255, 113, 113, 113),
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Row(
                        children: [
                          Text(
                            'เบี้ยประกันเริ่มต้น ',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 75, 75, 75),
                            ),
                          ),
                          Text(title),
                          Text(
                            ' บาท/ปี',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 75, 75, 75),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ]))
          ],
        ),
      ),
    );
  }
}
