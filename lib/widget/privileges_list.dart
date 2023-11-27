import 'package:flutter/material.dart';

class Privileges_list extends StatelessWidget {
  final String title;
  final String describe;
  final String price;
  const Privileges_list(
      {super.key,
      required this.title,
      required this.describe,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width,
        //color: Colors.amber,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        describe,
                        style: TextStyle(
                          fontSize: 10,
                          color: Color.fromARGB(255, 113, 113, 113),
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            'วงเงิน',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 75, 75, 75),
                            ),
                          ),
                          Spacer(),
                          Text(
                            price,
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 75, 75, 75),
                            ),
                          ),
                          const Text(
                            ' บาท/ปี',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 75, 75, 75),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                      const Divider(
                        color: Color(0xFFF0F0F0),
                        thickness: 2,
                      ),
                    ]))
          ],
        ),
      ),
    );
  }
}
