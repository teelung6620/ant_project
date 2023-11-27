import 'package:flutter/material.dart';

class CoinExchange extends StatelessWidget {
  final String title;
  const CoinExchange({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).devicePixelRatio * 10,
          vertical: MediaQuery.of(context).devicePixelRatio * 2,
        ),
        height: 180.0,
        width: constraints.maxWidth,
        decoration: BoxDecoration(
          color: const Color(0xFFFFE7EB),
          borderRadius: BorderRadius.circular(10), // กำหนดขอบโค้ง
        ),
        // color: Color.fromARGB(255, 255, 213, 227),
        //decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Flexcoin ของฉัน',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                ]),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF7697),
                      foregroundColor: Colors.white),
                  onPressed: () {
                    // ตอบสนองเมื่อปุ่มถูกกด
                  },
                  child: const Text(
                    'แลก Flexcoin',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Image.asset(
              'assets/images/image 2 (1).png',
              scale: 1,
            )
          ],
        ),
      );
    });
  }
}
