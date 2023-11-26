import 'package:ant_project/pages/detail_page.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  final String imgPath;
  final String title;
  final String describ;
  final String avai;
  final String coins;
  const ProductList(
      {super.key,
      required this.imgPath,
      required this.title,
      required this.describ,
      required this.avai,
      required this.coins});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              imgPath: imgPath.toString(),
              title: title.toString(),
              describ: describ.toString(),
              avai: avai.toString(),
              coins: coins.toString(),
            ),
          ),
        );
      },
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255), // สีพื้นหลัง
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                child: Image.asset(
                  imgPath,
                  width: MediaQuery.of(context).size.width * 0.35,
                  height:
                      MediaQuery.of(context).size.width * 0.35, // ปรับขนาดรูป
                  fit: BoxFit.cover, // หรือ BoxFit.fill ขึ้นอยู่กับความต้องการ
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    describ,
                    style: TextStyle(
                      fontSize: 12,
                      color: const Color.fromARGB(255, 113, 113, 113),
                    ),
                    softWrap: true,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Row(
                    children: [
                      Text(
                        'หมดเขต : 30 Nov 2023',
                        style: TextStyle(
                          fontSize: 12,
                          color: const Color.fromARGB(255, 113, 113, 113),
                        ),
                      ),
                      // Text(
                      //   " 400 | ",
                      //   style: TextStyle(fontSize: 13),
                      // ),
                      // Icon(
                      //   Icons.access_time_outlined,
                      //   size: 15,
                      // ),
                      // Text(
                      //   "30 Nov 2023",
                      //   style: TextStyle(fontSize: 13),
                      // ),
                    ],
                  ),
                  Text(
                    'available : ' + avai,
                    style: TextStyle(
                      fontSize: 12,
                      color: const Color.fromARGB(255, 113, 113, 113),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.monetization_on_rounded,
                        size: MediaQuery.of(context).size.width * 0.05,
                        color: Colors.amber,
                      ),
                      Text(
                        'x' + coins,
                        style: TextStyle(
                          fontSize: 12,
                          color: const Color.fromARGB(255, 113, 113, 113),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}