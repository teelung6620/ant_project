import 'package:flutter/material.dart';

class FlexpointList extends StatelessWidget {
  final String imgPath;
  final String title;
  const FlexpointList({super.key, required this.imgPath, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        elevation: 10,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
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
                    title,
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Row(
                    children: [
                      Text(
                        'หมดเขต : 30 Nov 2023',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 113, 113, 113),
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
                  const Text(
                    'available : 0',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 113, 113, 113),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.monetization_on_rounded,
                        size: MediaQuery.of(context).size.width * 0.05,
                        color: Colors.amber,
                      ),
                      const Text(
                        'x3',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 113, 113, 113),
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
